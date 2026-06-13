`timescale 1ns / 1ps

module DEM_8bit_1Hz_tb;

    reg        clk;
    reg        reset;
    reg        UD;
    reg        SS;
    wire [7:0] LED8;

    DEM_8bit_1Hz dut (
        .clk      (clk),
        .reset    (reset),
        .UD       (UD),
        .SS       (SS),
        .LED8     (LED8)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
    reset = 1; UD = 1; SS = 0;
    #100;
    reset = 0;

    // Đếm lên
    SS = 1; UD = 1;
    #5000;

    // Ngưng đếm
    SS = 0;
    #1000;

    // Đếm xuống
    SS = 1; UD = 0;
    #5000;

    $finish;
end

endmodule