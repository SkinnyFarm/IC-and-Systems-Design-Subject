module CK_DIV (
    input  clk50m,
    input  speed,
    output reg clkout
);
    reg [24:0] cnt;

    always @(posedge clk50m) begin
        if (cnt == (speed ? 5_000_000 : 25_000_000) - 1) begin
            clkout <= ~clkout;
            cnt    <= 0;
        end else
            cnt <= cnt + 1;
    end
    end

    initial begin cnt = 0; clkout = 0; end

endmodule


module Dan_LED_TP_8bit (
    input            clk, reset, MODE, SS,
    output reg [7:0] LED
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            LED <= 8'h00;
        else if (SS)
            case (MODE)
                1'b0: // Dich trai, fill 1
                    case (LED)
                        8'h00:   LED <= 8'h01;
                        8'hFF:   LED <= 8'h00;
                        default: LED <= {LED[6:0], 1'b1};
                    endcase
                1'b1: // Dich phai, fill 1
                    case (LED)
                        8'h00:   LED <= 8'h80;
                        8'hFF:   LED <= 8'h00;
                        default: LED <= {1'b1, LED[7:1]};
                    endcase
            endcase
    end

endmodule


module Dan_LED_TP_8bit_2Speed (
    input        clk, reset, MODE, SS, speed,
    output wire [7:0] LED
);
    wire clk_div;

    CK_DIV          IC1 (.clk50m(clk), .speed(speed), .clkout(clk_div));
    Dan_LED_TP_8bit IC2 (.clk(clk_div), .reset(reset),
                         .MODE(MODE), .SS(SS), .LED(LED));

endmodule