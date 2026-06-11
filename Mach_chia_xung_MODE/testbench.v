`timescale 1ns / 1ps

module CK_DIV_MODE_tb;

    reg        clk50m;
    reg  [1:0] mode;
    wire       clk;

    CK_DIV_MODE dut (
        .clk50m (clk50m),
        .mode   (mode),
        .clk    (clk)
    );

    initial clk50m = 0;
    always #10 clk50m = ~clk50m;

    initial begin
        // Mode 3 (50Hz) - dễ quan sát nhất
        mode = 2'd3; #2_000_000;

        // Mode 2 (10Hz)
        mode = 2'd2; #120_000_000;

        // Mode 1 (2Hz)
        mode = 2'd1; #600_000_000;

        // Mode 0 (1Hz)
        mode = 2'd0; #1_200_000_000;

        $finish;
    end

endmodule