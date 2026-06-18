`timescale 1ns/1ps

module tb_Dan_LED_TP_8bit_2Speed;

    reg  clk, reset, MODE, SS, speed;
    wire [7:0] LED;

    Dan_LED_TP_8bit_2Speed DUT (
        .clk(clk), .reset(reset),
        .MODE(MODE), .SS(SS),
        .speed(speed), .LED(LED)
    );

    always #10 clk = ~clk;

    // Task reset he thong
    task do_reset;
        begin
            SS = 0; reset = 1;
            #100 reset = 0;
        end
    endtask

    // Task chay LED voi mode va speed cho truoc
    task run_led;
        input m, sp;
        input integer cycles;
        begin
            MODE  = m;
            speed = sp;
            SS    = 1;
            repeat(cycles) @(posedge clk) #1;
            SS = 0;
            #100;
        end
    endtask

    initial begin
        clk = 0; reset = 0; MODE = 0; SS = 0; speed = 0;

        do_reset;

        // MODE=0, speed=0 (1Hz) → 8 buoc = 8 chu ky clk_div
        run_led(0, 0, 8 * 50_000_000);

        do_reset;

        // MODE=1, speed=1 (5Hz) → 8 buoc
        run_led(1, 1, 8 * 10_000_000);

        SS = 0;
        #20_000_000;
        $finish;
    end

    initial begin
        $dumpfile("tb_v2.vcd");
        $dumpvars(0, tb_Dan_LED_TP_8bit_2Speed);
    end

endmodule