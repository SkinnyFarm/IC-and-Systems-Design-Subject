module decoder2to4 (
    input [1:0] w,
    output reg [3:0] y
);
    always @(*) begin
        y = 4'b0;
        y[w] = 1;
    end
/*  Use logic gate:
    assign y[0] = ~w[0] & ~w[1];
    assign y[1] = w[0] & ~w[1];
    assign y[2] = ~w[0] & w[1];
    assign y[3] = w[0] & w[1];
*/

endmodule