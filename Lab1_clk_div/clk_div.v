// clk_div.v
module clk_div(clk_in, enable, reset, clk_out);
	input clk_in;   // Clock input
	input reset;    // Active high reset
   input enable;   // Enable toggle
   output clk_out; // Divided clock output
    
   reg clk_out;    // Register for the output
	
	// Trigger on the positive edge of th clock
	always @(posedge clk_in)
		if (reset)
			clk_out <= 1'b0; // Reset output to 0
		else if (enable)
			clk_out <= !clk_out; // Toggle output
endmodule