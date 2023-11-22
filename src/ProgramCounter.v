module ProgramCounter(
	input [31:0] PCNext,
	input Reset, Clock,PCWrite,
	output reg [31:0] PC );
	
	initial begin
		PC <= 32'h00000000;
	end

    always @(posedge Clock)
    begin
    	if (Reset)
    	begin
    		PC <= 32'h00000000;
    	end
    	else
    	begin
			if (PCWrite == 1) begin
				PC <= PCNext;
			end
			else
			begin
				PC += 4;
			end
    	end

		$display("PC=%h",PC);
    end
	
endmodule