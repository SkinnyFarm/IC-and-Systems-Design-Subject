module D_latch_tb;
    reg D, clk;
    wire Q;
    
    D_latch dut(D, clk, Q);
    
    initial clk = 0;
        always #5 clk = ~clk;
    initial begin
        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        $finish;
    end

endmodule
