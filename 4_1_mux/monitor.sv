`timescale 1ns / 1ps

typedef struct{
    bit D0;
    bit D1;
    bit D2;
    bit D3;
    bit [1:0] S;
    bit Y;
}mux_trans_t;

class monitor;
    
    virtual mux_if.tb_mp m_if;
        
    function new(virtual mux_if.tb_mp m_if);
        this.m_if = m_if;
    endfunction
    
    task capture(output mux_trans_t tr);
        
        #1;
        
        tr.D0 = m_if.D0;
        tr.D1 = m_if.D1;
        tr.D2 = m_if.D2;
        tr.D3 = m_if.D3;
        tr.S = m_if.S;
        tr.Y = m_if.Y;
        
    endtask
endclass