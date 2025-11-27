`timescale 1ns / 1ps

`timescale 1ns / 1ps

module mux_tb;
    
    //interface instances
    mux_if m_if();
    
    //dut instances
    mux4to1 dut(
        .D0(m_if.D0),
        .D1(m_if.D1),
        .D2(m_if.D2),
        .D3(m_if.D3),
        .S (m_if.S),
        .Y (m_if.Y)
    );
     
    //program instance   
    test t1 (m_if.tb_mp);
     
endmodule

program test (mux_if.tb_mp m_if);
    
    //object handlers
    driver drv;
    monitor mon;
    scoreboard sb;
    
    //transcaition class object 
    mux_trans_t tr;
    
    initial begin
        
        $display("4 : 1 mux simulation");
        
        //object creation
        drv = new(m_if);
        mon = new(m_if);
        sb = new();
        
        //loop for 10 test cases
        repeat(10) begin
            
            drv.drive();
            
            mon.capture(tr);
            
            sb.check(tr);
            
        end
        
        $display("The test is been completed successfully");
        
        $finish;
    end
    
endprogram