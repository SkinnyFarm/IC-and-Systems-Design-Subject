module Shift_SISO #(parameter N = 4) (
    input  wire clk,
    input  wire s_in,
    output wire s_out
);

    reg  [N-1:0] r_reg;
    wire [N-1:0] r_next;

    always @(posedge clk) begin
        r_reg <= r_next;
    end

    assign r_next = {s_in, r_reg[N-1:1]};

    assign s_out = r_reg[0];

endmodule