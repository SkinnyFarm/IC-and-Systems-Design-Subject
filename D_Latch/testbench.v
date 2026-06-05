module D_latch_tb;
    reg D, clk;
    wire Q;
    
    D_latch dut(D, clk, Q);
    
    initial begin 
    
        clk=0; D=0; #10;
        clk=0; D=1; #10;
        clk=1; D=0; #10;
        clk=1; D=1; #10;
        clk=1; D=0; #10;
        clk=0; D=1; #10;
        clk=0; D=0; #10;
        $finish;
    end

endmodule
