module Dich_TTR (
    input clk, rst,
    output reg [7:0] LED
);
    always @(posedge clk) begin
        if (rst) 
            LED = 8'b0001_1000; 
         else if (LED == 8'b0000_0000) 
                LED = 8'b0001_1000; 
         else begin
            LED[7:4] = LED[7:4] << 1;
            LED[3:0] = LED[3:0] >> 1;
         end
    end
endmodule