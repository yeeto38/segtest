// 1->A... DP->8 (DIG1->9 DIG2->10...)

module SevenSeg #(
		parameter NUMCELLS = 4
		)
	(
	 input clock,
	 input [8*NUMCELLS - 1:0] cellvalin,
	 output [11:0] sig
	);
	reg [NUMCELLS-1:0] sel = ~(1 << (NUMCELLS -1));
	reg [8*NUMCELLS -1:0] r_cellvalin = 0;
	reg [9:0] count=0;
	// reg [7:0] tog=0;
	
	always @(posedge clock) begin
		count <= count + 1;
		end
	always @(posedge count[9]) begin
			// if (tog == 8'b10000000) begin
				sel <= {sel[NUMCELLS - 2:0], sel[NUMCELLS - 1]};
				r_cellvalin <= sel == (~(1 << (NUMCELLS - 1))) ? cellvalin : 
				{r_cellvalin[8*(NUMCELLS-1) - 1:0], r_cellvalin[8*NUMCELLS - 1:8*(NUMCELLS - 1)]};			
			// end
			// tog <= tog + 1;
	end
	assign sig =
	//  tog == 8'b10000000 ? 
	{sel,r_cellvalin[8*NUMCELLS - 1:8*(NUMCELLS - 1)]};
	//  : {4'b0,r_cellvalin[8*NUMCELLS - 1:8*(NUMCELLS - 1)]};
endmodule