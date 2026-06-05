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

module Asynchronous_Counter (
    input clk,
    output [2:0] count
);
    wire Qn1, Qn2;
    
    T_FF ff0(.T(1'b1), .clk(clk), .Q(count[0]), .Qn(Qn1));
    T_FF ff1(.T(1'b1), .clk(Qn1), .Q(count[1]), .Qn(Qn2));
    T_FF ff2(.T(1'b1), .clk(Qn2), .Q(count[2]), .Qn());
endmodule