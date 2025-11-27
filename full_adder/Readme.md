Full Adder Verification – SystemVerilog (Vivado Simulator)

This project implements and verifies a 1-bit Full Adder using a structured SystemVerilog testbench.
It extends the concepts used in the Half Adder Verification project and introduces verification for a slightly more complex combinational circuit.

The testbench uses:

Interfaces

Program blocks

Self-checking logic

Exhaustive directed testing

Vivado-friendly simulation flow

📘 1. Project Overview

A Full Adder adds three 1-bit inputs:

A

B

Cin → Carry-in

And produces two outputs:

SUM

Cout → Carry-out

This design verifies all 8 input combinations and checks correctness using a self-checking structured testbench.

🔧 2. File Structure
/FullAdder_Verification
│
├── full_adder.sv          # DUT (Design Under Test)
├── full_adder_if.sv       # Interface for signal bundling
└── tb_full_adder.sv       # Testbench (includes program block)

📐 3. Design Overview

The Full Adder implements the two-level addition:

First add A and B (half add)

Then add Cin

Produce:

SUM (final LSB)

Cout (final carry-out)

The logic is fully combinational and does not require clocks or resets.

🧩 4. Interface Overview

The interface contains all DUT I/O signals:

A

B

Cin

SUM

Cout

Purpose:

Bundles all signals into a single handle

Provides cleaner wiring

Enables easy access for the test program

Keeps testbench modular and scalable

🧪 5. Testbench Overview

The structured SystemVerilog testbench includes:

✔ Interface Instance

Connects signals between DUT and TB.

✔ DUT Instance

Wired using the interface.

✔ Program Block

Contains the entire verification sequence, including:

Loop over all 8 input combinations

Expected value computation for SUM and Cout

Self-checking logic using comparisons

PASS/ERROR logging

Simulation termination with $finish

✔ No $dumpvars or $dumpfile

Vivado Simulator automatically generates .wdb waveform files.

🎯 6. Verification Methodology

This testbench verifies the Full Adder using:

✔ Directed exhaustive testing

All 8 combinations of (A, B, Cin) are tested.

✔ Self-checking

Expected values for SUM and Cout are computed inside the program block and compared with DUT outputs.

✔ Structured Testbench Architecture

Testbench → Interface → DUT → Program block
Just like verification done in industry.

🖥️ 7. Running Simulation in Vivado
Steps:

Create a new Vivado project

Add:

full_adder.sv → Design Sources

full_adder_if.sv → Simulation Sources

tb_full_adder.sv → Simulation Sources

Run:

Flow → Run Simulation → Run Behavioral Simulation


View PASS/ERROR results in the simulation console

Add signals to the waveform window if needed

Vivado will automatically produce .wdb waveform files.

📊 8. Expected Simulation Output (Console)

You will see PASS messages for all 8 test cases, such as:

[Pass] A=0 B=1 Cin=1 | SUM=0 Cout=1
...
Test been completed
$finish called at time : 8 ns

🎓 9. What You Learn

By completing this Full Adder verification, you learn:

How to extend structured testbenches to more complex logic

How to apply interface-based connectivity

How to use program blocks reliably in Vivado

How to perform exhaustive directed verification

How to compute expected values for multi-input combinational logic

How to design reusable and scalable TB structures