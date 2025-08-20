// converts [SEL, A, B, C, D, E, F, G, DP] to seg readable
module SegDecode #(
	)
(
	input [11:0] i,
	output [11:0] out
	/*output out1,
	output out2,
	output out3,
	output out4,
	output out5,
	output out6,
	output out7,
	output out8,
	output out9,
	output out10,
	output out11
	*/
);

// i: [SEL, A, B, C, D, E, F, G, DP]
assign out={i[11],i[7],i[2],i[10],i[9],i[6],i[8],i[1],i[5],i[0],i[4],i[3]};

endmodule
