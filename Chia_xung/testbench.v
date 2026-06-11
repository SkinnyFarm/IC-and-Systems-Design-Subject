`timescale 1ns / 1ps

module CK_1HZ_tb;

    reg  clk50m;
    wire clk1hz;

    CK_1HZ dut (
        .clk50m (clk50m),
        .clk1hz (clk1hz)
    );

    initial clk50m = 0;
    always #10 clk50m = ~clk50m;

    initial begin
        #600_000_000; // sim 0.6 giây -> đủ thấy clk1hz toggle
        $finish;
    end

endmodule