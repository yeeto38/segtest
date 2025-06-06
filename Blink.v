module Blink (
		input clock,
		output reg blink,
input timesig
,input reset
,output[31:0] elapsed
		);
reg [31:0] count=0;
/*
Timer #(.CLOCKSPEED(9000000)) timer1 (.timesig(timesig),.clock(clock),.reset(reset),.elapsed(elapsed));
*/
always @(posedge clock) begin
count <= count + 1;
if (count == 8'h10000000) begin
	blink <= ~blink;
	count <= 0;
end
end
endmodule
