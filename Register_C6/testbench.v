`timescale 1ns / 1ps

module Shift_SISO_tb;

    reg  clk;
    reg  s_in;
    wire s_out;

    Shift_SISO #(.N(4)) dut (
        .clk   (clk),
        .s_in  (s_in),
        .s_out (s_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Flush X ra ngoài
        s_in = 0; #40;

        // Dịch vào chuỗi bit: 1,0,1,1,0,0,1,0
        s_in = 1; #10;
        s_in = 0; #10;
        s_in = 1; #10;
        s_in = 1; #10;
        s_in = 0; #10;
        s_in = 0; #10;
        s_in = 1; #10;
        s_in = 0; #10;

        $finish;
    end

endmodule