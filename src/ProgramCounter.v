module ProgramCounter(

	input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
   	output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    	input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    	output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    	output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    	input  wire       ena,      // will go high when the design is enabled
    	input  wire       clk,      // clock
	input  wire       rst_n );     // reset_n - low to reset
	
	initial begin
		uo_out = 8'h00;
	end

	always @(posedge clk)
    	begin
		if (rst_n)
    		begin
    			ou_out <= 8'h00;
    		end
    		else
    		begin
			if (ena == 1) begin
				ou_out = ui_in;
			end
			else
			begin
				ou_out += 4;
			end
		end
	end
	
endmodule
