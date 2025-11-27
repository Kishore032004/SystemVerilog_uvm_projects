//Simulation file

`timescale 1ns / 1ps


module tb_half_adder;
    
    //interface instance
    half_adder_if ha_if();
    
    //DUT instance
    half_adder dut(
        .A(ha_if.A),
        .B(ha_if.B),
        .SUM(ha_if.SUM),
        .CARRY(ha_if.CARRY)
        );
    
    //program instance
    test t1(ha_if);
     
endmodule


program test (half_adder_if ha_if);

    initial begin
    
        logic exp_sum;
        logic exp_carry;
        
        //auto stimulus
        for(int i = 0; i < 4; i++)begin
            {ha_if.A, ha_if.B} = i;
            #1;
            
            //excpeted logic
            exp_sum = ha_if.A ^ ha_if.B;
            exp_carry = ha_if.A & ha_if.B;
            
            //self checking logic
            if(ha_if.SUM !== exp_sum || ha_if.CARRY !== exp_carry)begin
                $display("[Error] A = %0b | B = %0b | Excpeted SUM = %0b CARRY = %0b| Got SUM = %0b CARRY = %0b",ha_if.A,ha_if.B,exp_sum,exp_carry,ha_if.SUM,ha_if.CARRY);
            end else begin
                $display("[Pass] A = %0b | B = %0b |SUM = %0b | CARRY = %0b",ha_if.A,ha_if.B,ha_if.SUM,ha_if.CARRY);                
            end
        end
        $display("Test been completed");
        $finish;
     end
endprogram

