//design file


`timescale 1ns / 1ps


module bit2_comp(
    input logic [1:0] A,
    input logic [1:0] B,
    output logic LT,
    output logic EQ,
    output logic  GT
    );
    
    assign LT = (A < B);
    assign EQ = (A == B);
    assign GT = (A > B);
    
    
endmodule
