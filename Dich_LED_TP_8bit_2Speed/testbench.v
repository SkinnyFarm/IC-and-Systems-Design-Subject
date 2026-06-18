`timescale 1ns/1ps

module tb_Dich_LED_TP_8bit_2Speed;

    reg clk;
    reg reset;
    reg MODE;
    reg SS;
    reg speed;
    wire [7:0] LED8;

    Dich_LED_TP_8bit_2Speed DUT (
        .clk    (clk),
        .reset  (reset),
        .MODE   (MODE),
        .SS     (SS),
        .speed  (speed),
        .LED8   (LED8)
    );

    // Tao clock 50MHz
    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        // Khoi tao
        reset = 1;
        MODE  = 0;  
        SS    = 0;  
        speed = 0;  

        #50 reset = 0;  

        #20 SS = 1;
        #100000;

        MODE = 1;
        #40000 ;

        speed = 1;
        #20000 ;

        SS = 0;
        #5000 ;

        SS = 1;
        #10000 reset = 1;

        #20 reset = 0;
        #20000 ;

        $finish;
    end

endmodule