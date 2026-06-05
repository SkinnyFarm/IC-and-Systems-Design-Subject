module Dich_TNV (
    input clk, rst,
    output reg [7:0] LED
);
    always @(posedge clk) begin
        if (rst) 
            LED = 8'b1000_0001; 
         else if (LED == 8'b0000_0000) 
                LED = 8'b1000_0001; 
         else begin
            LED[7:4] = LED[7:4] >> 1;
            LED[3:0] = LED[3:0] << 1;
         end
    end
endmodule