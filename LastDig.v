module Input #(
	parameter NUMCELLS =4
)
(
input clock,
output [11:0] seg
);
reg [8*NUMCELLS -1:0]r_val ={NUMCELLS*8{1'b1}};
//                    
wire [11:0] sig = 12'b111111011111;

assign seg = sig;

endmodule
