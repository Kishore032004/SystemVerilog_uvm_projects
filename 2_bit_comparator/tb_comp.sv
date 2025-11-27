//simulation file

`timescale 1ns / 1ps

module tb_comp;

    //interface instances
    comp_interface comp_if();
    
    //dut instances
    bit2_comp dut (
        .A  (comp_if.A),
        .B  (comp_if.B),
        .LT (comp_if.LT),
        .EQ (comp_if.EQ),
        .GT (comp_if.GT)
        );
        
    //program instances
    test t1(comp_if.tb_mp);
    
endmodule


program test (comp_interface.tb_mp comp_if);

    initial begin
        
        // Variables for the expected (reference) model
        logic exp_lt;
        logic exp_eq;
        logic exp_gt;

        $display("Starting Test of 2-bit Comparator...\n");

        // Generate 10 random tests
        repeat (10) begin

            // Randomize 2-bit values for A and B
            comp_if.A = $urandom_range(0,3);
            comp_if.B = $urandom_range(0,3);

            #1;  // allow DUT to update outputs

            // Golden reference model
            exp_lt = (comp_if.A <  comp_if.B);
            exp_eq = (comp_if.A == comp_if.B);
            exp_gt = (comp_if.A >  comp_if.B);

            // Scoreboard comparison
            if (comp_if.LT !== exp_lt ||
                comp_if.EQ !== exp_eq ||
                comp_if.GT !== exp_gt)
            begin
                $display("[ERROR] A=%0b | B=%0b | Expected: LT=%0b EQ=%0b GT=%0b | Got: LT=%0b EQ=%0b GT=%0b",
                         comp_if.A, comp_if.B,
                         exp_lt, exp_eq, exp_gt,
                         comp_if.LT, comp_if.EQ, comp_if.GT);
            end
            else begin
                $display("[PASS]  A=%0b | B=%0b | LT=%0b EQ=%0b GT=%0b",
                         comp_if.A, comp_if.B,
                         comp_if.LT, comp_if.EQ, comp_if.GT);
            end

        end // repeat

        $display("\n2-bit comparator test completed!");
        $finish;

    end // initial

endprogram