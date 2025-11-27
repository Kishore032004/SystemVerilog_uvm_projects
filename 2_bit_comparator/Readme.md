📘 2-bit Comparator Verification (SystemVerilog)

This project implements and verifies a 2-bit Comparator using a structured SystemVerilog testbench.
The verification flow includes:

Interface + modports

Program block

Random stimulus

Scoreboard (expected model vs DUT)

PASS/ERROR result logging

All simulations were run using Vivado Simulator (XSIM).

📌 Project Structure
project/
│
├── src/
│   └── comparator.sv          # DUT (Design Under Test)
│
├── tb/
│   ├── comp_interface.sv      # Interface with modports
│   └── tb_comp.sv             # Testbench + Program block + Scoreboard
│
└── README.md

🧩 DUT — 2-bit Comparator

The DUT compares two 2-bit inputs:

A and B (both logic [1:0])

Outputs:

LT → 1 if A < B

EQ → 1 if A == B

GT → 1 if A > B

The logic is pure combinational and uses simple data-flow assignments.

⚙️ Interface (With Modports)

A SystemVerilog interface is used to group all signals together.
Modports ensure correct direction mapping:

dut_mp → DUT reads A,B and drives LT,EQ,GT

tb_mp → Testbench drives A,B and reads LT,EQ,GT

This avoids Vivado's typical “non-net variable cannot be connected” issues.

🧪 Testbench Architecture

The testbench follows a structured verification style:

✔ Interface Instance

Used as communication channel between TB and DUT.

✔ DUT Instance

Connected through the interface.

✔ Program Block

Contains the full test logic:

Random stimulus generation

Expected model computation

Scoreboard comparison

PASS/ERROR logging

Clean simulation finish

✔ Scoreboard

The scoreboard checks DUT outputs vs expected outputs:

exp_LT = (A <  B);
exp_EQ = (A == B);
exp_GT = (A >  B);


If mismatch occurs → ERROR
If match → PASS

🔄 Random Stimulus

10 random test iterations are performed:

comp_if.A = $urandom_range(0,3);
comp_if.B = $urandom_range(0,3);


Each random input combination is verified through the scoreboard.

📤 Example Simulation Output
Starting Test of 2-bit Comparator...

[PASS]  A=11 | B=00 | LT=0 EQ=0 GT=1
[PASS]  A=10 | B=01 | LT=0 EQ=0 GT=1
[PASS]  A=10 | B=10 | LT=0 EQ=1 GT=0
[PASS]  A=01 | B=01 | LT=0 EQ=1 GT=0
...

2-bit comparator test completed!
$finish at 10 ns


The exact results vary each run due to randomization.

🛠 Tools Used

Vivado 2025.1 (XSIM Simulator)

SystemVerilog

Random test generation

Scoreboard-based verification

🎯 What You Learn from This Project

Writing a clean, synthesizable DUT

Using SystemVerilog interfaces

Using modports (DUT vs TB roles)

Building structured testbenches

Creating reference models

Scoreboard-based checking

Random stimulus generation

Program block execution

Debugging with PASS/ERROR logs