// State machine
// Cycles from Idle -> Inspection -> Holdstart -> Timing
// switch is a signal that comes comes in when the state should be changed
module State #(
)
(
input swotch,
input clock,
output reg [1:0] state
);

localparam Idle = 2'b00;
localparam Inspection = 2'b01;
localparam Holdstart = 2'b10;
localparam Timing = 2'b11;
always @(posedge clock) begin
	if (swotch) begin
		case(state)
			Idle: begin
				state <= Inspection;
				end
			Inspection: begin
				state <= Holdstart;
				end
			Holdstart: begin
				state <= Timing;
				end
			Timing : begin
				state <= Idle;
				end
			default:;
		endcase
	end
end
endmodule
