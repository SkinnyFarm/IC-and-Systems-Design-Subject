`timescale 1ns / 1ps

module Synchronous_Counter_tb;

    localparam N = 8;

    reg              clk;
    reg              reset;
    wire [N-1:0]     q;

    Synchronous_Counter #(.N(N)) dut (
        .clk   (clk),
        .reset (reset),
        .q     (q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        #20;
        reset = 0;
        #300;
        $finish;
    end

endmodule