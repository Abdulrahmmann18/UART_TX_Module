module TX_OUT_MUX
(
	input wire 		 ser_data,
	input wire 		 par_bit,
	input wire [1:0] mux_sel,
	output reg  	 TX
);  

	always @(*) begin
		TX = 1'b1;  // default value
		case (mux_sel) 
			2'b00 : TX = 1'b0;
			2'b01 : TX = 1'b1;
			2'b10 : TX = ser_data;
			2'b11 : TX = par_bit;
		endcase
	end
	

endmodule