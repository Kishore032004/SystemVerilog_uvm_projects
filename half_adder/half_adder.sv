//Design file

`timescale 1ns / 1ps

module half_adder(

    input logic A,
    input logic B,
    output logic SUM,
    output logic CARRY
);

    assign SUM = A ^ B;
    assign CARRY = A & B;
    
endmodule
