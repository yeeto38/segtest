module sevensegin #(
		parameter NUMCELLS =4
		)
	(
	 input rst,
	 input clock,
	 output [11:0] seg 
	);
wire [8 * NUMCELLS - 1:0] decodedtimer;
reg [4 * NUMCELLS - 1:0] toutsig;
wire [11:0] sig;
Timer t (.rst(rst), .clock(clock), .elapsed(toutsig));
TimerDecode timeout (.i(toutsig), .out(decodedtimer));
SevenSeg suibian (.clock(clock), .cellvalin(decodedtimer), .sig(sig));
SegDecode dcod (.i(sig), .out(seg));
endmodule
