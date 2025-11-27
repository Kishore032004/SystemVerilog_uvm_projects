`timescale 1ns / 1ps


module alu_4bit_tb;
reg [3:0] a,b;
reg [2:0] alu_sel;
wire [3:0] alu_out;
wire carry_out;

    alu_4bit uut (
    .a(a),
    .b(b),
    .alu_sel(alu_sel),
    .alu_out(alu_out),
    .carry_out(carry_out)
    );
    
    reg [4:0] excepted;
    
    integer i, j, k;
    
    initial begin
    
        $display("*****************************************");
        $display("**************ALU TEST BEGIN*************");
        $display("*****************************************");
        for(i = 0; i < 16; i = i + 1)begin
            for(j = 0; j < 16; j = j + 1)begin
                for(k = 0; k < 5; k = k + 1)begin
                
                a = i; b = j; alu_sel = k;
                #1;
                
                case(alu_sel)
                    3'b000: excepted = a + b;
                    3'b001: excepted = a - b;
                    3'b010: excepted = {1'b0, (a & b)};
                    3'b011: excepted = {1'b0, (a | b)};
                    3'b100: excepted = {1'b0, (a ^ b)};
                    default: excepted = 5'b00000;
                    endcase
                    
                    if({carry_out, alu_out} !== excepted)
                        $display("fail");
                    else    
                        $display("pass| a = %d | b = %d | alu_sel = %b | result = {%b, %b}", a,b,alu_sel,carry_out,alu_out);                             
                end
            end
        end
        
        $display("*****************************************");
        $display("**************ALU OUTPUT*****************");
        $display("*****************************************");
        $finish;
     end
endmodule
