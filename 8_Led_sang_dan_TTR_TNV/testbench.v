module Dan_TTR_TNV_tb;
    reg clk = 0, reset, ss, mode; 
    wire [7:0] LED;

    always #5 clk = ~clk;

    Dan_TTR_TNV uut(.clk(clk), .reset(reset), .ss(ss), .mode(mode), .LED(LED));

    initial begin
        reset = 1; #10;

        reset = 0;
        ss = 1; mode = 1;
        #40;

        reset = 1; #10;

        reset = 0;
        ss = 1; mode = 0;
        #40;

        reset = 1; 
        #10;

        $finish;
    end
endmodule