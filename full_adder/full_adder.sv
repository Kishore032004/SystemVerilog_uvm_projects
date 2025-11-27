//Design File

`timescale 1ns / 1ps

module full_adder(
    input logic A,
    input logic B,
    input logic Cin,
    output logic SUM,
    output logic CARRY
    );
    
    assign SUM = A ^ B ^ Cin;
    assign CARRY = (A & B) | (B & Cin) |(A & Cin); 
endmodule
