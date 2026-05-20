// clk_div_tb.v
module clk_div_tb;
	reg clk_in;
	reg reset;
	reg enable;
	wire clk_out;
	
	// Instantiate the Design Under Test (DUT)
	clk_div INST1(
		.clk_in(clk_in),
		.enable(enable),
		.reset(reset),
		.clk_out(clk_out)
	);
	
	// Generate clock: toggle every 1 time unit
	initial clk_in = 1'b0;
	always #1 clk_in = ~clk_in;
	
	// Test sequence
	initial begin
	
		// 1. Initialize all signals and set reset to 1 (enable reset)
      clk_in = 1'b0;
      reset = 1'b1;    // <--- Important! Set reset = 1 at the start of the simulation.
      enable = 1'b1;
		  
		
		// 2. Wait a short time for the main program to initialize clk_out to 0.
      #2 reset = 1'b0; // <--- Release reset (at this point, the reset waveform should drop to 0)

      // 3. Continue simulating subsequent actions
      #180 reset = 1'b1; // Reset during simulation
      #2 reset = 1'b0;
      #20 $finish;
	end
endmodule