module Dan_TTR_TNV(
    input clk, reset, ss, mode, 
    output reg [7:0] LED
);
    always @(posedge clk) begin
        if (reset) LED = 8'b0000_0000;
        else begin
            if (ss) begin
                if (mode) begin
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