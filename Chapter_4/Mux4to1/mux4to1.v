module mux4to1 (
    input [3:0] w,
    input[1:0] s,
    output reg f
);
always @(*) begin
       f = w[s];
end 
endmodule