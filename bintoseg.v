module bintoseg #(
		parameter NUMDIGITS =4
	)
	(
	input [3:0] digit,
	output [7:0] seg
	);
	reg [7:0] out;

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

	always @(*) begin
		case (digit)
			4'b0000: out = ZERO;
			4'b0001: out = ONE;
			4'b0010: out = TWO;
			4'b0011: out = THREE;
			4'b0100: out = FOUR;
			4'b0101: out = FIVE;
			4'b0110: out = SIX;
			4'b0111: out = SEVEN;
			4'b1000: out = EIGHT;
			4'b1001: out = NINE;
			default: out = 8'b00000001;
		endcase
	end

	assign seg = out;
endmodule
