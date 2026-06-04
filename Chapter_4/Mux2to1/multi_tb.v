`include "multi.v"
module multi_tb;
reg w0,w1,s;
wire f;

multi mux (.w0(w0), .w1(w1), .s(s), .f(f));
initial begin
    $dumpfile ("multi.vcd");
    $dumpvars(0,multi_tb);
    s=0; w0=0; w1=0; #10;  // f = 0
    s=0; w0=0; w1=1; #10;  // f = 0
    s=0; w0=1; w1=0; #10;  // f = 1
    s=0; w0=1; w1=1; #10;  // f = 1

    s=1; w0=0; w1=0; #10;  // f = 0
    s=1; w0=0; w1=1; #10;  // f = 1
    s=1; w0=1; w1=0; #10;  // f = 0
    s=1; w0=1; w1=1; #10;  // f = 1
    $finish;
end

endmodule

    
