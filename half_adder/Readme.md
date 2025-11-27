Half Adder is implemented in simple dataflow style

Logic follows:

SUM = A XOR B

CARRY = A AND B

Pure combinational circuit (no clock/reset)

🧩 4. Interface Overview

Bundles A, B, SUM, CARRY

Simplifies wiring between DUT and testbench

Provides a clean handle for program block access

🧪 5. Testbench Overview

The testbench:

Instantiates the interface

Instantiates the DUT and connects through the interface

Runs a program block that:

Applies all 4 combinations of A & B

Computes expected SUM and CARRY

Compares with DUT output

Prints PASS/ERROR messages

Ends the simulation gracefully

No $dumpvars or $dumpfile is used — Vivado captures waveform .wdb automatically.

🖥️ 6. Running in Vivado
Steps:

Create a new Vivado project

Add:

half_adder.sv → Design Sources

half_adder_if.sv → Simulation Sources

tb_half_adder.sv → Simulation Sources

Run:

Flow → Run Simulation → Run Behavioral Simulation


Observe PASS/FAIL logs in console

Optionally add signals to waveform window

📝 7. Expected Output (Console)

PASS messages for all 4 combinations, ending with:

Test been completed
$finish called at time : 4 ns

🎓 8. What You Learn

How structured SystemVerilog testbenches work

Testbench → Interface → DUT connection flow

How program blocks avoid race conditions

How self-checking works

How to run behavioral simulations in Vivado

How to organize verification projects cleanly