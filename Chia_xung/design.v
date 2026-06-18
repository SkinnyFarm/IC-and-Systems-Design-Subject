module CK_1HZ (
    input  wire clk50m,
    output reg  clk1hz
);

    reg [24:0] cnt; // Điểm gãy xung clk1hz (nửa chu kì)

    initial begin
        cnt    <= 1;
        clk1hz <= 0;
    end

    always @(posedge clk50m) begin
        if (cnt == 25_000_000) begin // 50 triệu xung clk50m -> clk1z -> chu kì = 1 giây -> toggle clk1hz tại 0,5 giây
            clk1hz <= ~clk1hz;
            cnt    <= 1;
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule