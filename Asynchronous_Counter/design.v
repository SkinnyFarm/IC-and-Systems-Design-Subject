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
        if (T) begin
            Q <= ~Q;
            Qn <= ~Qn;
        end
    end
endmodule