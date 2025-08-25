// 1->A... DP->8 (DIG1->9 DIG2->10...)

module SevenSeg #(
		// parameter CLOCKSPEED = 12000000,
		// parameter CLOCKSPEED = 10000000,
		parameter CLOCKSPEED = 10000,
		parameter NUMCELLS = 4
		)
	(
	 input clock,
	 input [8*NUMCELLS - 1:0] cellvalin,
	 output [11:0] sig
	);

// slowed clock
	reg [31:0] count=0;

	reg [NUMCELLS-1:0] sel = {1'b0,{(NUMCELLS-1){1'b1}}};
	reg [31:0] selstate = 0;

	wire [NUMCELLS-1:0] selnext;
	assign selnext = {sel[NUMCELLS - 2:0], sel[NUMCELLS - 1]};

	wire[NUMCELLS * 8 - 1:0] shiftedval;
	assign shiftedval = cellvalin >> (8*selstate);
	reg [7:0] rcellvalin = 0;

	// reg [7:0] sigdigit = cellvalin[8 * selstate + 7 -: 8];
	
	always @(posedge clock) begin
		rcellvalin <= shiftedval[7:0];
		count <= count + 1;
		if (count == CLOCKSPEED / NUMCELLS - 1) begin
			count <= 0;
			sel <= selnext;
			if (selstate == NUMCELLS - 1) begin
				selstate <= 0;
			end else begin
				selstate <= selstate + 1;
			end
		end
		// sigdigit <= cellvalin[8 * selstate + 7 -: 8];

	end
	// always @(posedge count[13]) begin
	// // if (tog == 8'b10000000) begin
	// 	sel <= selnext; // rotates sel
	// 	selstate <= selstate + 1; // index sel to a state

	// 	if (selstate == NUMCELLS - 1) begin
	// 		selstate <= 0;
	// 	end		
	// 	// rcellvalin <= rcellvalinnext;
	// end

	// assign sigdigit = cellvalin[8 * selstate + 7 : 8 * selstate];

	assign sig = {sel, rcellvalin};

	// always begin
	// 	case(sel) 
	// 	4'b0111: sigdigit = cellvalin[7:0];
	// 	4'b1011: sigdigit = cellvalin[15:8];
	// 	4'b1101: sigdigit = cellvalin[23:16];
	// 	4'b1110: sigdigit = cellvalin[31:24];
	// 	default: sigdigit = cellvalin[7:0];
	// 	endcase

	// end
	// assign sigdigit = (sel == 4'b0111) ? cellvalin[7:0] : (sel == 4'b1011) ? cellvalin[15:8] : (sel == 4'b1101) ? cellvalin[23:16] : cellvalin[31:24];

	// assign sig = {sel,sigdigit};
endmodule