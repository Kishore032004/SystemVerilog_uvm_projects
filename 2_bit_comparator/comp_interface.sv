//simulation file

`timescale 1ns / 1ps

interface comp_interface;
    
    logic [1:0] A;
    logic [1:0] B;
    logic LT;
    logic EQ;
    logic GT;
    
    //can use it secipally for dut purposes (can call as comp_interface.dut_mp)
    modport dut_mp(
        input A,B,
        output LT, EQ, GT
        );
     //can use it secipally for testbench purposes (can call as comp_interface.tb_mp)
     modport tb_mp(
        input A,B,
        output LT, EQ, GT
        );        
        
endinterface
