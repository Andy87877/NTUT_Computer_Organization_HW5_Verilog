// FullAdder4bit.v

module FullAdder4bit (S, C4, A, B, Cin);
    input [3:0] A, B; // 4-bit inputs
    input Cin;        // Carry input
    output [3:0] S;   // 4-bit sum output
    output C4;        // Carry output

    // Behavioral addition: concatenate C4 and S
    assign {C4, S} = A + B + Cin;
endmodule