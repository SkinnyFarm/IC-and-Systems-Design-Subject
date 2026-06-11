module CK_DIV ( input clk50m, output reg clkout);

    reg [24:0] cnt;

    initial begin
        cnt    = 1;
        clkout = 0;
    end

    always @(posedge clk50m) begin
        if (cnt == 25) begin
            clkout <= ~clkout;
            cnt    <= 1;
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule

module DEM_8bit (
    input clk,
    input reset,
    input UD,
    input SS,
    output reg  [7:0] LED8
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            LED8 <= 8'b0;
        else begin
            if (SS) begin
                if (UD)
                    LED8 <= LED8 + 1;
                else
                    LED8 <= LED8 - 1;
            end
        end
    end

endmodule

module DEM_8bit_1Hz (
    input clk,
    input reset,
    input UD,
    input SS,
    output wire [7:0] LED8
);

    wire clk_1hz;

    CK_DIV  IC1 (.clk50m(clk),     .clkout(clk_1hz));
    DEM_8bit IC2 (.clk(clk_1hz),   .reset(reset),
                  .UD(UD),          .SS(SS),
                  .LED8(LED8));

endmodule