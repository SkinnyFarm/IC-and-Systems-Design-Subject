module dec2to4_en (
    input [1:0] w,
    input en,
    output reg [3:0] y
);

always @(*) begin
    y = 4'b0;
    if (en == 1) 
        y [w] = 1;
    else 
        y = 4'b0;

end
endmodule