module multi (
    input w0,w1,s,
    output f
);


assign f = (~s & w0) | (s & w1);

endmodule