`timescale 1ns/1ps

module Shift_reg_tb;

reg in, clk;
wire [3:0] out;

Shift_reg_FFD sreg (.in(in), .clk(clk), .out(out));

initial clk = 0;
    always #5 clk = ~clk;

initial begin
   in = 1;
   #10
   in = 0;
   #10
   in = 1;
   #10
   in = 1;
   #10
   in = 1;
   #10
   in = 0;
   #10
   in = 0;
   #10
   in = 0;

   $finish;
end  
    
endmodule