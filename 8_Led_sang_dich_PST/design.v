module Dich_PST (
    input clk, rst,
    output reg [7:0] LED
);
    always @(posedge clk) begin
        if (rst) 
            LED = 8'b0000_0001; 
         else if (LED == 8'b0000_0000) 
                LED = 8'b0000_0001; 
         else 
            LED = LED << 1;
    end
endmodule