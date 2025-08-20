module TimerDecode #(
	NUMCELLS = 4
	)
(
	input [4 * NUMCELLS - 1:0] in,
	output [8 * NUMCELLS - 1:0] out
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

	genvar i;
	generate
		for (i = 0; i < NUMCELLS; i = i + 1) begin: convert_bten
			reg [7:0] digit;
			always @* begin
				case (in[4 * (NUMCELLS - i) - 1 : 4 * (NUMCELLS - i - 1)])
					4'd0: digit = ZERO;
					4'd1: digit = ONE;
					4'd2: digit = TWO;
					4'd3: digit = THREE;
					4'd4: digit = FOUR;
					4'd5: digit = FIVE;
					4'd6: digit = SIX;
					4'd7: digit = SEVEN;
					4'd8: digit = EIGHT;
					4'd9: digit = NINE;
					default: digit = 8'b00000000;
				endcase
			end
			assign out[8 * (NUMCELLS - i) - 1 : 8 * (NUMCELLS - i - 1)] = digit;
		end
	endgenerate

endmodule
