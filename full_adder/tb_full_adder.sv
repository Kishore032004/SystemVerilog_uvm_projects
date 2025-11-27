//Simulation File

`timescale 1ns / 1ps


module tb_full_adder;
    
    full_adder_if full_if();
    
    full_adder dut(
        .A(full_if.A),
        .B(full_if.B),
        .Cin(full_if.Cin),
        .SUM(full_if.SUM),
        .CARRY(full_if.CARRY)
        );

    test t1(full_if);
       
endmodule

program test (full_adder_if full_if);
    
    initial begin
        
        logic exp_sum;
        logic exp_carry;
        
        
        $display("*****************Full adder simualtion with 8 test cases********************");
        for(int i = 0; i < 8; i++)begin
            
            {full_if.A, full_if.B, full_if.Cin} = i;
            
            #1;
            
            exp_sum = full_if.A ^ full_if.B ^ full_if.Cin;
            exp_carry = (full_if.A & full_if.B) | (full_if.B & full_if.Cin) | (full_if.A & full_if.Cin);
            
            if(exp_sum !== full_if.SUM || exp_carry !== full_if.CARRY)begin
                $display("[Error] A = %0b | B = %0b | Cin = %0b | Expected Sum = %0b Carry = %0b | Got Sum = %0b Carry = %0b ", full_if.A,full_if.B,full_if.Cin,exp_sum,exp_carry,full_if.SUM,full_if.CARRY);
            end else begin
                $display("[Pass] A = %0b | B = %0b | Cin = %0b |Sum = %0b | Carry = %0b ", full_if.A,full_if.B,full_if.Cin,full_if.SUM,full_if.CARRY);
            end
        end        
        
        $display("Test completed");
        $finish;
        
    end
endprogram