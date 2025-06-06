// Assumes 12MHz clock speed (can be changed)
// Outputs 1ms pulse that resets on rst
module Timer#(
		// parameter CLOCKSPEED = 12000000,
		 parameter CLOCKSPEED = 10000000,
		parameter NUMDIGITS = 4
		)
	(
	 input rst,
	 input clock,
	 output reg [4 * NUMDIGITS - 1:0] elapsed
	);
	reg [31:0] buffer = 0;
	reg [3:0] digits [NUMDIGITS - 1];
	integer i;
	always @(posedge clock) begin
		if (~rst) begin
			if (buffer == CLOCKSPEED/1000 - 1) begin
				digits[0] <= digits[0] + 1;
				for (i = 0; i < NUMDIGITS - 1; i = i + 1) begin
					if (digits[i] == 4'b1001) begin
						digits[i] <= 4'b0000;
						digits[i + 1] <= digits[i + 1] + 1;
					end
				end
				buffer <= 0;
			end else begin
				buffer <= buffer + 1;
			end
		end
		else begin
			for (i = 0; i < NUMDIGITS; i = i + 1) begin
				digits[i] <= 4'd0000;
			end
			buffer <= 0;
		end
	end

	// assign pulse = (buffer == CLOCKSPEED/1000 - 1);
endmodule
