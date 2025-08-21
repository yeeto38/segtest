module sevensegin #(
		parameter NUMCELLS =4
		)
	(
	 input rst,
	 input clock, //12 mHZ
	 output [11:0] seg 
	);
wire [8 * NUMCELLS - 1:0] decodedtimer;
wire [4 * NUMCELLS - 1:0] toutsig;
wire [11:0] sig;
Timer t (.rst(rst), .clock(clock), .elapsed(toutsig));
TimerDecode timeout (.in(toutsig), .out(decodedtimer));
SevenSeg suibian (.clock(clock), .cellvalin(decodedtimer), .sig(sig));

// reg [20:0] buffer = 0;
// wire [11:0] v;
// reg [11:0] r = 0;
// assign v=r;
// always @(posedge clock) begin
// 	buffer <= buffer + 1;
// end

// always @(posedge buffer[13]) begin
// 	case (buffer[15:14])
// 	2'b00: r<=12'hb64;
// 	2'b01: r<=12'h7a6;
// 	2'b10: r<=12'he6c;
// 	2'b11: r<=12'hd76;
// 	endcase
// end

// SegDecode dcod (.i(v), .out(seg));
SegDecode dcod (.i(sig), .out(seg));
endmodule
