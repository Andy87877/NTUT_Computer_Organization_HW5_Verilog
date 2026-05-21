// clkdiv3_tb.v

`timescale 1ns/100ps // Define time unit and precision
module clkdiv3_tb;
    reg clk, reset;
    wire clk_out;

    // Instantiate the DUT
    ClockBy3 INST (clk, reset, clk_out);

    // Initialize clock
    initial clk = 1'b0;
    
    // Generate clock: period = 10 time units
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        #5 reset = 1'b1;  // Apply reset
        #10 reset = 1'b0; // Release reset
        #500 $finish;     // Run for 500 time units then end
    end

    // Monitor and dump signals for waveform viewer
    initial begin
        $monitor("clk = %b, reset = %b, clk_out = %b", clk, reset, clk_out);
        $dumpfile("clkdiv3_tb.vcd"); // Output VCD file
        $dumpvars(0, clkdiv3_tb);    // Dump all variables
    end
endmodule