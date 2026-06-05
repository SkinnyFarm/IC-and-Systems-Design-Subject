module Dich_TTR_tb;
    reg clk, rst;
    wire [7:0] LED;
    
    Dich_TTR uut(.clk(clk), .rst(rst), .LED(LED));

    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        rst = 1; 
        #20;
        rst = 0;
        #100;
        $finish;
    end
endmodule