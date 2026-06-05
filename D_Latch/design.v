module D_latch (
    input D, clk,
    output reg Q
);
    always @ (D,clk)
        if(clk) begin
            Q = D;
        end
   
endmodule