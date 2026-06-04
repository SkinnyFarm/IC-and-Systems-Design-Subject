`timescale 1ns/1ps
`include "mux4to1.v"

module mux4to1_tb;
    reg [3:0] w;
    reg [1:0] s;
    wire f;

mux4to1 test (w,s,f);

integer i;
initial begin
    $dumpfile ("mux4to1.vcd");
    $dumpvars (0,mux4to1_tb);
        w = 4'b1001;
        for (i=0; i<4; i=i+1 ) begin   
        s = i; #10;
    end
$finish;
end
 
endmodule