`timescale 1ns / 1ps

module CounterUD_tb;

    reg        clk;
    reg        reset;
    reg        ud;
    wire [7:0] q;

    CounterUD dut (
        .clk   (clk),
        .reset (reset),
        .ud    (ud),
        .q     (q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; ud = 1;
        #20;
        reset = 0;

        // Đếm lên
        ud = 1;
        #100;

        // Đếm xuống
        ud = 0;
        #100;

        $finish;
    end

endmodule