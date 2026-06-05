`timescale 1ns/1ps

module Counter_tb;
    reg clk;
    wire [3:0] count;

    Counter uut (.clk(clk), .count(count));

    initial clk = 0;
			always #5 clk = ~clk; // 10ns clock period

    initial begin
			#200;
			$finish;
    end

endmodule