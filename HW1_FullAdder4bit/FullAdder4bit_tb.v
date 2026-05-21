// FullAdder4bit_tb.v

`timescale 1ns/1ps
module FullAdder4bit_tb;
    reg [3:0] A, B; // Test inputs
    reg Cin;        // Test carry input
    wire [3:0] S;   // Output sum
    wire C4;        // Output carry

    // Instantiate the DUT
    FullAdder4bit DUT (
        .S(S), 
        .C4(C4), 
        .A(A), 
        .B(B), 
        .Cin(Cin)
    );

    // Test sequence with various inputs
    initial begin
        // Case 0: Initialization
        A = 4'b0000; B = 4'b0000; Cin = 1'b0;
        
        // Case 1: 3 + 5 = 8 (No carry)
        #10 A = 4'b0011; B = 4'b0101; Cin = 1'b0; 
        
        // Case 2: 15 + 1 = 16 (Produces carry, sum is 0)
        #10 A = 4'b1111; B = 4'b0001; Cin = 1'b0; 
        
        // Case 3: 10 + 5 + 1(Cin) = 16 (Produces carry, sum is 0)
        #10 A = 4'b1010; B = 4'b0101; Cin = 1'b1; 
        
        #10 $finish; // End simulation
    end
endmodule