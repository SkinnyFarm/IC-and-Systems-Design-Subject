`timescale 1ns/1ps

module tb_Dich_LED_TN_8bit_2Speed;

    reg clk;
    reg reset;
    reg MODE;
    reg SS;
    reg speed;
    wire [7:0] LED;

    Dich_LED_TN_8bit_2Speed DUT (
        .clk    (clk),
        .reset  (reset),
        .MODE   (MODE),
        .SS     (SS),
        .speed  (speed),
        .LED   (LED)
    );

    initial clk = 0;
    always #10 clk = ~clk;


    initial begin
       
        reset = 1;
        MODE  = 0;   
        SS    = 0; 
        speed = 0;  

        #50 reset = 0;   
        #20 SS = 1;     

        MODE = 0;
        #100000;
        MODE = 1;
        #100000;

        $finish;
    end

endmodule