`timescale 1ns / 1ps


class driver;
    
    //to handle the interface signals in the driver class
    virtual mux_if.tb_mp m_if;
        
    function new(virtual mux_if.tb_mp m_if);
        //creating consutor
        this.m_if = m_if;
        
    endfunction
    
    task drive();
        
        m_if.D0 = $urandom_range(0,1);
        m_if.D1 = $urandom_range(0,1);
        m_if.D2 = $urandom_range(0,1);
        m_if.D3 = $urandom_range(0,1);
        
        m_if.S = $urandom_range(0,3);
        
        #1;
        
    endtask
endclass