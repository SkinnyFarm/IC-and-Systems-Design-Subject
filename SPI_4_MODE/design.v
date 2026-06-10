////////////////////////////////////////////////////////////////////////////////
// Module Name : spi_master
// Description : SPI Master hỗ trợ 4 mode (CPOL/CPHA) - chuẩn theo timing diagram
////////////////////////////////////////////////////////////////////////////////
module spi_master (
    input        clk,
    input        rst,
    input        start,
    input  [1:0] mode,      // {CPOL, CPHA}
    input  [7:0] data_in,
    output reg   mosi,
    output reg   sclk,
    output reg   cs,
    output reg   done
);

wire cpol = mode[1];
wire cpha = mode[0];

reg [2:0] bit_cnt;
reg [7:0] shift_reg;
reg [3:0] clk_div;
reg       busy;

// Chia clock: toggle SCLK mỗi 5 chu kỳ clk hệ thống
wire sclk_en = (clk_div == 4);

// Phát hiện cạnh dựa trên giá trị sclk TRƯỚC khi toggle:
//   Leading  edge: sclk đang ở idle (= cpol)  -> sắp chuyển sang active (~cpol)
//   Trailing edge: sclk đang ở active (~cpol) -> sắp chuyển về idle (cpol)
wire leading_edge  = sclk_en && busy && (sclk ==  cpol);
wire trailing_edge = sclk_en && busy && (sclk == ~cpol);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        mosi      <= 0;
        sclk      <= 0;
        cs        <= 1;
        done      <= 0;
        bit_cnt   <= 0;
        shift_reg <= 0;
        clk_div   <= 0;
        busy      <= 0;
    end else begin
        done <= 0;

        // ----------------------------------------------------------------
        // Bắt đầu giao dịch
        // ----------------------------------------------------------------
        if (start && !busy) begin
            busy      <= 1;
            cs        <= 0;
            shift_reg <= data_in;
            bit_cnt   <= 0;
            clk_div   <= 0;
            sclk      <= cpol;       // SCLK về trạng thái idle đúng mode

            // CPHA=0: drive bit đầu tiên ngay khi CS xuống
            // (trước leading edge đầu tiên, đúng với Mode 0 và Mode 2)
            if (!cpha)
                mosi <= data_in[7];
        end

        // ----------------------------------------------------------------
        // Đang truyền
        // ----------------------------------------------------------------
        if (busy) begin
            clk_div <= clk_div + 1;

            // Toggle SCLK
            if (sclk_en) begin
                clk_div <= 0;
                sclk    <= ~sclk;
            end

            // ---- CPHA = 0 (Mode 0 & Mode 2) ----
            // Drive MOSI tại trailing edge -> chuẩn bị bit tiếp theo
            // Slave đã sample tại leading edge trước đó
            if (!cpha && trailing_edge) begin
                if (bit_cnt == 7) begin
                    // Đã truyền xong 8 bit
                    busy <= 0;
                    cs   <= 1;
                    done <= 1;
                end else begin
                    // Shift và drive bit tiếp theo
                    shift_reg <= {shift_reg[6:0], 1'b0};
                    mosi      <= shift_reg[6];
                end
                bit_cnt <= bit_cnt + 1;
            end

            // ---- CPHA = 1 (Mode 1 & Mode 3) ----
            // Drive MOSI tại leading edge
            // Slave sample tại trailing edge
            if (cpha && leading_edge) begin
                mosi      <= shift_reg[7];
                shift_reg <= {shift_reg[6:0], 1'b0};
                if (bit_cnt == 7) begin
                    busy <= 0;
                    cs   <= 1;
                    done <= 1;
                end
                bit_cnt <= bit_cnt + 1;
            end
        end

    end
end

endmodule