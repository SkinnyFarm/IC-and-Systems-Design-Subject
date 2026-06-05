`timescale 1ns/1ps
`include "en4to2.v"

module en4to2_tb;
    reg [3:0] w;
    wire [1:0] y;

en4to2 test(w,y);
initial begin 
    $dumpfile ("en4to2_tb.vcd");
    $dumpvars (0,en4to2_tb);
    w = 4'b0001; #10;
    w = 4'b0010; #10;
    w = 4'b0100; #10;
    w = 4'b1000; #10;
    $finish;
end

endmodule