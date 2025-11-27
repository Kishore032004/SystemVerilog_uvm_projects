//design file


`timescale 1ns / 1ps


module mux4to1(
    input logic D0,
    input logic D1,
    input logic D2,
    input logic D3,
    input logic [1:0] S,
    output logic Y
    );
    
    always_comb begin
        
        case(S)
            
            2'b00: Y = D0;
            2'b01: Y = D1;
            2'b10: Y = D2;
            2'b11: Y = D3;
            
        endcase
        
    end
endmodule
