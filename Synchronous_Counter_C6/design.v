module Synchronous_Counter #(parameter N = 8) (
    input   clk, reset,
    output wire [N-1:0] q
);

    reg  [N-1:0] r_reg;
    wire [N-1:0] r_next;

    // Body, register
    always @(posedge clk or posedge reset) begin
        if (reset)
            r_reg <= {N{1'b0}};
        else
            r_reg <= r_next;
    end

    // Next state logic (IMPORTANT)
    assign r_next = r_reg + 1'b1;

    // Output
    assign q = r_reg;

endmodule