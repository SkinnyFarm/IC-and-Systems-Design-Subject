`timescale 1ns/1ps
`include "RS.v"

module RS_tb;
    reg S,R,clk;
    wire Q,Qn;

RS test (S,R,clk,Q,Qn);

initial clk = 0;
   always #5 clk = ~clk;
initial begin
    $dumpfile ("RS.vcd");
    $dumpvars (0,RS_tb);
        S=0; R=0; #10;
        S=0; R=1; #10;
        S=1; R=0; #10;
        S=0; R=0; #10;
        S=1; R=1; #10;
    $finish;
end

endmodule