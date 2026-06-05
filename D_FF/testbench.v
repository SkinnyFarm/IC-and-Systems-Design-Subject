module D_FF_tb;
    reg D, clk, pre, rst;
    wire Q, Qn;

    D_FF dut ( .D(D), .clk(clk), .pre(pre), .rst(rst), .Q(Q), .Qn(Qn) );

    initial clk =0;
        always #5 clk = ~clk;
    initial begin
        D = 0; pre = 0; rst = 0;
        #10 D = 1; pre = 0; rst = 0;
        #10 D = 0; pre = 0; rst = 0;
        #10 D = 1; pre = 1; rst = 0;
        #10 D = 0; pre = 0; rst = 0;
        #10 D = 1; pre = 0; rst = 1;
        #10 D = 1; pre = 0; rst = 0;
        #20 $finish;
    end
    
endmodule