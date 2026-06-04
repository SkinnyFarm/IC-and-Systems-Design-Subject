`timescale 1ns/1ps
`include "decoder2to4.v"

module decoder2to4_tb;
    reg [1:0] w;
    wire [3:0] y;

decoder2to4 test (w,y);

integer i; 
initial begin
    $dumpfile ("decoder2to4_tb.vcd");
    $dumpvars (0,decoder2to4_tb);
    for (i=0; i<4; i=i+1) begin
        w = i;
        #10;
    end
$finish;
end

endmodule