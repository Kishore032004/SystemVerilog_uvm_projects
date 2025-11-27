`timescale 1ns / 1ps

class scoreboard;

    // Constructor (nothing to initialize here)
    function new();
    endfunction

    // Task: compare DUT output with expected value
    task check(input mux_trans_t tr);

        bit expected;

        // Compute expected output based on select line
        case (tr.S)
            2'b00: expected = tr.D0;
            2'b01: expected = tr.D1;
            2'b10: expected = tr.D2;
            2'b11: expected = tr.D3;
        endcase

        // Compare actual vs expected
        if (tr.Y !== expected) begin
            $display("[ERROR] S=%0d | D0=%0d D1=%0d D2=%0d D3=%0d | Expected Y=%0d | Got Y=%0d",
                    tr.S, tr.D0, tr.D1, tr.D2, tr.D3, expected, tr.Y );
        end
        else begin
            $display("[PASS]  S=%0d | Inputs=%0d%0d%0d%0d | Y=%0d",
                    tr.S, tr.D3, tr.D2, tr.D1, tr.D0, tr.Y );
        end

    endtask

endclass
