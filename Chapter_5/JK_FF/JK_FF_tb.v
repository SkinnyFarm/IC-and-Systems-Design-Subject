`timescale 1ns/1ps
`include "JK_FF.v"

module JK_FF_tb;
    reg pre,clr,clk;
    reg J,K;
    wire Q,Qn;

JK_FF test (pre,clr,clk,J,K,Q,Qn);

initial clk=1;
    always #5 clk= ~clk;
initial begin
    $dumpfile ("JK_FF.vcd");
    $dumpvars (0,JK_FF_tb);
        pre=0; clr=0; J=0; K=0; #10;
        pre=0; clr=1; J=0; K=0; #10;
        pre=1; clr=0; J=0; K=0; #10;
        pre=1; clr=1; J=0; K=0; #10;
        pre=1; clr=1; J=0; K=1; #10;
        pre=1; clr=1; J=1; K=0; #10;
        pre=1; clr=1; J=1; K=1; #10;
    $finish;
    end

endmodule