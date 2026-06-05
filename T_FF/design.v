module T_FF (
    input T,clk,
    output reg Q, Qn
);
    initial begin
        Q = 1;
        Qn = 0;
    end
    always @(posedge clk) begin
        if (T) begin
            Q <= ~Q;
            Qn <= ~Qn;
        end
    end
endmodule