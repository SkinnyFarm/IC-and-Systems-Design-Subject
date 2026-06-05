module  FF_D (
    input D, clk,
    output reg Q
);
initial Q = 0;
always @(posedge clk)
    Q <= D;
endmodule

module Shift_reg (
    input in,clk,
    output wire [3:0] out
);
wire q1,q2,q3;
FF_D ffd1 (in,clk,q1);
FF_D ffd2 (q1,clk,q2);
FF_D ffd3 (q2,clk,q3);
FF_D ffd4 (q3,clk,out[3]);
assign out[2:0] = {q3, q2, q1};

endmodule