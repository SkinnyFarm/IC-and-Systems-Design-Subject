module CK_DIV (
    input clk50m,
    input speed,
    output reg clkout
);

    reg [24:0] cnt;
    reg [24:0] toggle;

    always @(*) begin
        case (speed)
            1'b0: toggle = 500; // 1Hz  (sim) / 25_000_000 (thực)
            1'b1: toggle = 100; // 5Hz  (sim) /  5_000_000 (thực)
        endcase
    end

    initial begin
        cnt    = 1;
        clkout = 0;
    end

    always @(posedge clk50m) begin
        if (cnt == toggle) begin
            clkout <= ~clkout;
            cnt    <= 1;
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule

module DEM_8bit (
    input  clk, reset, UD, SS,
    output reg  [7:0] LED8
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            LED8 <= 8'b0;
        else begin
            if (SS) begin
                if (!UD)
                    LED8 <= LED8 + 1;
                else
                    LED8 <= LED8 - 1;
            end
        end
    end

endmodule

module DEM_8bit_2Speed (
    input clk,
    input reset,
    input UD,
    input SS,
    input speed,
    output wire [7:0] LED8
);

    wire clk_div;

    CK_DIV   IC1 (.clk50m(clk), .speed(speed), .clkout(clk_div));
    DEM_8bit IC2 (.clk(clk_div), .reset(reset),
                  .UD(UD), .SS(SS), .LED8(LED8));

endmodule