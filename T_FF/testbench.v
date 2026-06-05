module T_FF_tb;
    reg T, clk;
    wire Q, Qn;

    T_FF uut (
        .T(T),
        .clk(clk),
        .Q(Q),
        .Qn(Qn)
    );

    initial begin
        // Initialize signals
        T = 0;
        clk = 0;

        // Apply test stimulus
        #10 T = 1; // Set T to 1
        #20 T = 0; // Set T to 0
        #30 T = 1; // Set T to 1
        #40 T = 0; // Set T to 0

        // Finish simulation after some time
        #50 $finish;
    end
    
    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units

endmodule