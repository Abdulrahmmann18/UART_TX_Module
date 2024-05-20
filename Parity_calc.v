module Parity_calc #(parameter DATA_LENGTH = 8)
(
	input wire [DATA_LENGTH-1:0] P_DATA,
	input wire 					 Data_valid,
	input wire 					 PAR_TYPE,
	input wire  				 Enable_Par_Output,
	output reg 				 	 PAR_BIT
);  
	
	reg [DATA_LENGTH-1:0] P_DATA_Reg;

	always @(*) begin
		PAR_BIT = 1'b0;
		P_DATA_Reg = 'b0;
		if (Enable_Par_Output)
			PAR_BIT = (~PAR_TYPE) ? (^P_DATA_Reg) : (~^P_DATA_Reg);
		else if (Data_valid) begin
			P_DATA_Reg = P_DATA;
		end
		else begin
			PAR_BIT = 1'b0;
			P_DATA_Reg = 'b0;
		end
	end

endmodule