module digitadd
	(
	 input rst,
	 input trigger,
	 output [3:0] digit,
	 output o_trigger
	);
	reg [3:0] r_digit=0;
	always @(negedge trigger) begin
//		if (rst) begin
//			r_digit <= 0;
//		end
//		else begin
			r_digit <= (rst || (r_digit == 9)) ? 0 : r_digit + 1;
//		end
	end
	
	assign o_trigger = (r_digit == 9);
	assign digit = rst ? 0 : r_digit;
	// assign pulse = (trigger == CLOCKSPEED/1000 - 1);
endmodule
