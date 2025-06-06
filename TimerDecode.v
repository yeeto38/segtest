module SegDecode #(
	)
(
	input [16:0] i, // goes up to 131072, input is in ms, so 131s
	output [31:0] out
);
	localparam  ZERO = 8'b11111100;
	localparam   ONE = 8'b01100000;
	localparam   TWO = 8'b11011010;
	localparam THREE = 8'b11110010;
	localparam  FOUR = 8'b01100110;
	localparam  FIVE = 8'b10110110;
	localparam   SIX = 8'b10111110;
	localparam SEVEN = 8'b11100000;
	localparam EIGHT = 8'b11111110;
	localparam  NINE = 8'b11110110;

// i: [SEL, A, B, C, D, E, F, G, DP]
assign out={i[11],i[7],i[2],i[10],i[9],i[6],i[8],i[1],i[5],i[0],i[4],i[3]};

endmodule
