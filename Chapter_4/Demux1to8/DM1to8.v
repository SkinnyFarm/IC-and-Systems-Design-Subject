module demux1to8 (
    input D,
    input [2:0] S,
    output reg [7:0] Y
);

always @(*) begin
    Y = 8'b0;
    Y[S] = D;
end
// Cách làm khác:
/*  always @(*) begin
        // Default tất cả output = 0
        Y = 8'b0;

        case ({S2, S1, S0})
            3'b000: Y[0] = D;
            3'b001: Y[1] = D;
            3'b010: Y[2] = D;
            3'b011: Y[3] = D;
            3'b100: Y[4] = D;
            3'b101: Y[5] = D;
            3'b110: Y[6] = D;
            3'b111: Y[7] = D;
        endcase
*/    
endmodule