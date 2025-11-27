`timescale 1ns / 1ps

module alu_4bit(
input [3:0] a,b,
input [2:0] alu_sel, 
output reg [3:0] alu_out,
output reg carry_out
);

    always @ (*) begin
        case(alu_sel)
            3'b000: {carry_out, alu_out} = a + b;
            3'b001: {carry_out, alu_out} = a - b;
            3'b010: {carry_out, alu_out} = {1'b0, (a & b)};
            3'b011: {carry_out, alu_out} = {1'b0, (a | b)};
            3'b100: {carry_out, alu_out} = {1'b0, (a ^ b)};
            default: {carry_out, alu_out} = 5'b00000;
        endcase
    end        
endmodule
