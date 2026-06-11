`timescale 1ns / 1ps

module DEM_8bit_2Speed_tb;

    reg        clk;
    reg        reset;
    reg        UD;
    reg        SS;
    reg        speed;
    wire [7:0] LED8;

    DEM_8bit_2Speed dut (
        .clk   (clk),
        .reset (reset),
        .UD    (UD),
        .SS    (SS),
        .speed (speed),
        .LED8  (LED8)
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
    reset = 1; UD = 0; SS = 0; speed = 0;
    #100;
    reset = 0;

    // speed=0 - đếm lên
    speed = 0; SS = 1; UD = 0;
    #200000;

    // speed=1 - đếm lên
    speed = 1; SS = 1; UD = 0;
    #200000;

    // speed=1 - đếm xuống
    speed = 1; SS = 1; UD = 1;
    #200000;

    // Ngưng
    SS = 0;
    #10000;

    $finish;
end

endmodule