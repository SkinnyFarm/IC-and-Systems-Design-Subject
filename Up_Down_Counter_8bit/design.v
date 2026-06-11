module CounterUD (
    input  wire clk,
    input  wire reset,
    input  wire ud,
    output wire [7:0]  q
);

    reg  [7:0] r_reg;
    wire [7:0] r_next;

    always @(posedge clk or posedge reset) begin
        if (reset)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end

    assign r_next = (ud == 1) ? r_reg + 1 : r_reg - 1;

    assign q = r_reg;

endmodule