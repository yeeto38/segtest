module Input #(
	parameter NUMCELLS =4
)
(
input clock,
input [31:0] r_val,
output [11:0] seg
);
/*	localparam  ZERO = 8'b11111100;
	localparam   ONE = 8'b01100000;
	localparam   TWO = 8'b11011010;
	localparam THREE = 8'b11110010;
	localparam  FOUR = 8'b01100110;
	localparam  FIVE = 8'b10110110;
	localparam   SIX = 8'b10111110;
	localparam SEVEN = 8'b11100000;
	localparam EIGHT = 8'b11111110;
	localparam  NINE = 8'b11110110;
*/
// reg [8*NUMCELLS -1:0]r_val ={NUMCELLS*8{1'b1}};
// reg [8*NUMCELLS -1:0] r_val={EIGHT,SEVEN,SIX,FIVE};
wire [11:0] sig;
SevenSeg suibian (.clock(clock), .cellvalin(r_val), .sig(sig));
SegDecode dcod (.i(sig), .out(seg));
endmodule
