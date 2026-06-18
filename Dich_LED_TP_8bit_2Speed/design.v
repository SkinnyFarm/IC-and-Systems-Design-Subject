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

module Dich_LED_TP_8bit (
    input  clk, reset, MODE, SS,
    output reg  [7:0] LED8
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            LED8 <= 8'b0000_0000;
        else begin
            if (SS) begin
                if (MODE) begin
                    if (LED8==8'b0000_0000) LED8 = 8'b1000_0000;
                    else if (LED8 == 8'b1111_1111) LED8 = 8'b0000_0000;
                    else begin
                        LED8 = LED8 >>1;
                        LED8[7] = 1'b1;
                    end
                end
                else begin
                    if (LED8 == 8'b0000_0000) LED8 = 8'b0000_0001;
                    else if (LED8 == 8'b1111_1111) LED8 = 8'b0000_0000;
                    else begin
                        LED8 = LED8 <<1;
                        LED8[0] = 1'b1;
                    end
                end
            end
            else LED8 = LED8;
    end
    end

endmodule

module Dich_LED_TP_8bit_2Speed (
    input clk,
    input reset,
    input MODE,
    input SS,
    input speed,
    output wire [7:0] LED8
);
    wire clk_div;

    CK_DIV   IC1 (.clk50m(clk), .speed(speed), .clkout(clk_div));
    Dich_LED_TP_8bit IC2 (.clk(clk_div), .reset(reset),
                          .MODE(MODE), .SS(SS), .LED8(LED8));

endmodule