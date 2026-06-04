module JK_FF (
    input pre,clr,clk,
    input J,K,
    output reg Q, Qn
);

    always @(negedge clk, negedge pre, negedge clr) begin
        if (!pre && !clr) begin
                Q = 1;
                Qn = 1;
            end
        else if (!pre) begin Q=1; Qn=0; end
            else if (!clr) begin Q=0; Qn=1; end
                else begin
                    case ({J,K})
                        2'b00: begin Q=Q; Qn=Qn; end
                        2'b01: begin Q=0; Qn=1; end
                        2'b10: begin Q=1; Qn=0; end
                        2'b11: begin Q= ~Q; Qn= ~Qn; end
                    endcase
                end
    end
// Pham Trieu Khang Duy 9111
endmodule