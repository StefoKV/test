module tt_um_ProgramCounter(

	input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
   	output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    	input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    	output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    	output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    	input  wire       ena,      // will go high when the design is enabled
    	input  wire       clk,      // clock
	input  wire       rst_n );     // reset_n - low to reset

	assign uio_oe = 8'b11111111;

	reg  [7:0] PC;
	
	//initial begin
	//	uo_out = 8'h00;
	//end

	always @(posedge clk)
    	begin
		if (rst_n)
    		begin
    			PC <= 8'h00;
    		end
    		else
    		begin
			if (ena == 1) begin
				PC <= ui_in;
			end
			else
			begin
				PC <= PC + 4;
			end
		end
	end

	assign uo_out = PC;
	
endmodule
