`timescale 1ns/1ps

module Synchronous_Counter_tb;
    reg clk;
    wire [3:0] Q;

    Synchronous_Counter uut(clk, Q);

    initial clk = 0;
        always #5 clk = ~clk; // Clock with a period of 10ns


    initial begin

        #200; 
        $finish;
    end
endmodule