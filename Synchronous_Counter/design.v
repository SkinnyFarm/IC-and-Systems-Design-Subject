module T_FF (
    input T,clk,
    output reg Q,
    output Qn
);
    initial begin
        Q = 1'b0;
    end

    assign Qn = ~Q;
    
    always @(posedge clk) begin
        if (T)
             Q = ~Q;
        else
             Q = Q;  
    end
endmodule

module Synchronous_Counter (
    input clk,
    output [3:0] Q
);

    T_FF TFF0(1'b1,clk,Q[0]);
    T_FF TFF1(Q[0],clk,Q[1]);
    T_FF TFF2(Q[0] & Q[1],clk,Q[2]);
    T_FF TFF3(Q[0] & Q[1] & Q[2],clk,Q[3]);
endmodule