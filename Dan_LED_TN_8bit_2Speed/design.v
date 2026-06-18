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

module Dan_LED_TN_8bit (
    input  clk, reset, MODE, SS,
    output reg  [7:0] LED
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            LED <= 8'b0000_0000;
        else begin
              if (SS) begin
                if (MODE) begin
                    if (LED == 8'b0000_0000) LED = 8'b0001_1000;
                    else if (LED == 8'hFF) LED = 8'b0000_0000;
                    else begin
                        LED[7:4] = LED[7:4] << 1;
                        LED[4] = 1'b1;
                        LED[3:0] = LED[3:0] >> 1;
                        LED[3] = 1'b1;
                    end
                end
                else begin
                    if (LED == 8'b0000_0000) LED = 8'b1000_0001;
                    else if (LED == 8'hFF) LED = 8'b0000_0000;
                    else begin
                        LED[7:4] = LED[7:4] >> 1;
                        LED[7] = 1'b1;
                        LED[3:0] = LED[3:0] << 1;
                        LED[0] = 1'b1;
                    end
                end
            end
            else LED = LED;
    end
    end

endmodule

module Dan_LED_TN_8bit_2Speed (
    input clk,
    input reset,
    input MODE,
    input SS,
    input speed,
    output wire [7:0] LED
);
    wire clk_div;

    CK_DIV   IC1 (.clk50m(clk), .speed(speed), .clkout(clk_div));
    Dan_LED_TN_8bit IC2 (.clk(clk_div), .reset(reset),
                          .MODE(MODE), .SS(SS), .LED(LED));

endmodule