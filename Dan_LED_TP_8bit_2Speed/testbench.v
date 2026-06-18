module tb_Dan_LED_TP_8bit_2Speed;

    reg clk;
    reg reset;
    reg MODE;
    reg SS;
    reg speed;
    wire [7:0] LED;

    Dan_LED_TP_8bit_2Speed DUT (
        .clk    (clk),
        .reset  (reset),
        .MODE   (MODE),
        .SS     (SS),
        .speed  (speed),
        .LED    (LED)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0; reset = 1; MODE = 0; SS = 0; speed = 0;
        #100 reset = 0; SS = 1;

        MODE = 0; speed = 0; repeat(8) #1000000000; 

        MODE = 1; speed = 1; repeat(8) #500000000;

        SS = 0;
        #20000000;
        $finish;
    end

endmodule