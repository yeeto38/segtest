// Assumes 12MHz clock speed (can be changed)
// Outputs 1ms pulse that resets on rst
module Timer#(
		parameter CLOCKSPEED = 12000000,
		// parameter CLOCKSPEED = 10000000,
		parameter NUMCELLS = 4
		)
	(
	 input rst,
	 input clock,
	 output reg [4 * NUMCELLS - 1:0] elapsed
	);
	reg [31:0] buffer = 0;
	reg ting = 0;
	reg [3:0] digits [NUMCELLS - 1:0]; // 4 bit for each digit (base10)
	integer i;
	always @(posedge clock) begin
		if (pause) begin
			ting <= ~ting;
		end
		if (~rst) begin
			if (buffer == CLOCKSPEED/100 - 1) begin // 10ms, 0.01s precision
				digits[0] <= digits[0] + 1;
				for (i = 0; i < NUMCELLS - 1; i = i + 1) begin // if current digit is 9 and i am adding 1
					if (digits[i] == 4'b1010) begin // switch this digit to 0 and next digit adds 1
						digits[i] <= 4'b0000;
						digits[i + 1] <= digits[i + 1] + 1;
					end
				end
				buffer <= 0;
			end 
			else begin
				if (~ting) begin
					buffer <= buffer + 1;s
				end
			end
		end
		else begin // resets all digits to 0
			for (i = 0; i < NUMCELLS; i = i + 1) begin
				digits[i] <= 4'd0000;
			end
			buffer <= 0;
		end
	end


// always @(*) begin
// 	assign elapsed = {digits[3], digits[2], digits[1], digits[0]};
// end

integer j;
always @(*) begin
    for (j = 0; j < NUMCELLS; j = j + 1) begin
        elapsed[j*4 +: 4] = digits[j];
    end
end

	// assign pulse = (buffer == CLOCKSPEED/1000 - 1);
endmodule
