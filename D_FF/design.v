module D_FF (
    input D,clk,pre,rst,
    output reg Q,
    output Qn
);
    assign Qn = ~Q;
    always @(posedge clk, posedge pre, posedge rst) begin
        if (pre) Q = 1;
        else if (rst) Q = 0;
        else Q = D;
    end

endmodule