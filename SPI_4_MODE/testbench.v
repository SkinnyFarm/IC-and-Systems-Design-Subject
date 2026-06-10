`timescale 1ns / 1ps
`include "design.v"

module spi_master_tb;

    // Inputs
    reg        clk;
    reg        rst;
    reg        start;
    reg  [1:0] mode;
    reg  [7:0] data_in;

    // Outputs
    wire       mosi;
    wire       sclk;
    wire       cs;
    wire       done;

    // Instantiate UUT
    spi_master uut (
        .clk     (clk),
        .rst     (rst),
        .start   (start),
        .mode    (mode),
        .data_in (data_in),
        .mosi    (mosi),
        .sclk    (sclk),
        .cs      (cs),
        .done    (done),
    );

    // Clock 100 MHz
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("design.vcd");
        $dumpvars(0, spi_master_tb);

        // Khoi tao
        rst     = 1;    // Bat reset
        start   = 0;
        mode    = 2'b00;
        data_in = 8'h00;
        #40;
        rst = 0;        // Tha reset -> DUT bat dau hoat dong
        #40;

        // ---- TC1: Mode 0 (CPOL=0, CPHA=0) | data = 0xA5 ----
        mode    = 2'b00;
        data_in = 8'hA5;
        #40;
        start = 1; #10; start = 0;
        #1200;

        // ---- TC2: Mode 1 (CPOL=0, CPHA=1) | data = 0x3C ----
        mode    = 2'b01;
        data_in = 8'h3C;
        #40;
        start = 1; #10; start = 0;
        #1200;

        // ---- TC3: Mode 2 (CPOL=1, CPHA=0) | data = 0x69 ----
        mode    = 2'b10;
        data_in = 8'h69;
        #40;
        start = 1; #10; start = 0;
        #1200;

        // ---- TC4: Mode 3 (CPOL=1, CPHA=1) | data = 0xF0 ----
        mode    = 2'b11;
        data_in = 8'hF0;
        #40;
        start = 1; #10; start = 0;
        #1200;

        $finish;
    end

endmodule