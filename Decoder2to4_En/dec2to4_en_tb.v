`include "dec2to4_en.v"
`timescale 1ns/1ps

module dec2to4_en_tb;
    reg [1:0] w;
    reg en;
    wire [3:0] y;

dec2to4_en test (w,en,y);
integer i;
initial begin
    $dumpfile ("dec2to4_en_tb.vcd");
    $dumpvars (0,dec2to4_en_tb);
    // test en=1
    en = 1;
    for (i=0; i<4; i=i+1) begin
        w = i;
        #10;
    end
    // test en=0
    en = 0;
    for (i=0; i<4; i=i+1) begin
        w = i;
        #10;
    end
    $finish;
end

endmodule