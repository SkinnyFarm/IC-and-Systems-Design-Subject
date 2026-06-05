module JK_FF (
    input clk,
    input J,K,
    output reg Q, 
    output Qn
);
    assign Qn = ~Q;

    initial Q = 1'b0;

    always @(posedge clk) begin
         case ({J,K})
            2'b00:  Q <= Q;
            2'b01:  Q <= 0;
            2'b10:  Q <= 1;
            2'b11:  Q <= ~Q;
         endcase
    end
    
endmodule

module Counter (
    input clk,
    output [3:0] count
);
    wire clk1, clk2, clk3;

    JK_FF  ff0 (.J(1'b1), .K(1'b1), .clk(clk), .Q(count[0]), .Qn(clk1));
    JK_FF  ff1 (.J(1'b1), .K(1'b1), .clk(clk1), .Q(count[1]), .Qn(clk2));
    JK_FF  ff2 (.J(1'b1), .K(1'b1), .clk(clk2), .Q(count[2]), .Qn(clk3));
    JK_FF  ff3 (.J(1'b1), .K(1'b1), .clk(clk3), .Q(count[3]), .Qn());

endmodule