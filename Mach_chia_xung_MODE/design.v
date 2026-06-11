module CK_DIV_MODE (
    input  wire clk50m,
    input  wire [1:0] mode,
    output reg  clk
);

    reg [24:0] cnt;
    reg [24:0] toggle;

 // Giá trị đảo = 50MHz / (2 * f_out)
    always @(*) begin
        case (mode)
            2'd0: toggle = 25_000_000; // clk1Hz
            2'd1: toggle = 12_500_000; // clk2Hz
            2'd2: toggle =  2_500_000; // clk10Hz
            2'd3: toggle =    500_000; // clk50Hz
            default: toggle = 25_000_000;
        endcase
    end

    initial begin
        cnt = 1;
        clk = 0;
    end

    always @(posedge clk50m) begin
        if (cnt == toggle) begin
            clk <= ~clk;
            cnt <= 1;
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule