`include "DM1to8.v"

module demux1to8_tb;
    reg D;
    reg [2:0] S;
    wire [7:0] Y;

demux1to8 test (D,S,Y);
integer i;
initial begin
    $dumpfile ("DM1to8.vcd");
    $dumpvars (0,demux1to8_tb);
     D = 1;
        for (i = 0; i < 8; i = i + 1) begin
            S = i; #10;
        end
    $finish;
end
endmodule