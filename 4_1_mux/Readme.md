📘 4:1 MUX Verification (SystemVerilog – Driver, Monitor, Scoreboard)

This project implements a structured verification environment for a 4:1 Multiplexer using SystemVerilog.
The verification is organized using the same architecture used in real industry testbenches:

Driver

Monitor

Scoreboard

Interface (with modports)

Program Block

Top Testbench

The simulation is run in Vivado XSIM.

📌 1. DUT Description – 4:1 Multiplexer

The DUT selects one of four 1-bit inputs (D0–D3) based on a 2-bit select line (S):

S	Output
00	D0
01	D1
10	D2
11	D3

Output is Y.

The DUT is purely combinational.

📌 2. Verification Architecture Overview
       +---------+        +--------+        +-------------+
Inputs | Driver  | -----> |  DUT   | -----> |   Monitor   |
       +---------+        +--------+        +-------------+
                                                  |
                                                  v
                                           +--------------+
                                           | Scoreboard   |
                                           |  (Check)     |
                                           +--------------+

✔ Driver

Randomizes D0–D3 and S

Drives DUT inputs through the interface

✔ Monitor

Samples D0–D3, S, and Y

Packages them into a transaction struct

✔ Scoreboard

Computes expected Y using golden reference model

Compares expected vs DUT output

Prints PASS/ERROR messages

✔ Program Block

Coordinates:

driver → 2. monitor → 3. scoreboard
Repeated multiple times.

📌 3. File Structure
mux_project/
│
├── mux4to1.sv          (DUT)
├── mux_if.sv           (Interface with modports)
├── driver.sv           (Generates inputs)
├── monitor.sv          (Captures transactions)
├── scoreboard.sv       (Checks correctness)
├── test.sv             (Program block)
└── mux_tb.sv           (Top testbench)


Each file has a single responsibility — clean, modular, scalable.

📌 4. Transaction Format

All sampled values are stored in:

typedef struct {
    bit D0;
    bit D1;
    bit D2;
    bit D3;
    bit [1:0] S;
    bit Y;
} mux_trans_t;


This struct is passed from monitor → scoreboard.

📌 5. Golden Reference Model

Inside the scoreboard:

case (tr.S)
    2'b00: expected = tr.D0;
    2'b01: expected = tr.D1;
    2'b10: expected = tr.D2;
    2'b11: expected = tr.D3;
endcase


Scoreboard checks:

if (tr.Y !== expected)
    ERROR
else
    PASS

📌 6. Running the Simulation (Vivado XSIM)

Create a fresh Vivado project

Add all .sv files under Simulation Sources

Set compilation order (interface first)

Run:

Run Behavioral Simulation


Expected output:

[PASS]  S=2 | Inputs=1001 | Y=0
[PASS]  S=3 | Inputs=0110 | Y=0
...
4:1 MUX Verification Completed!

📌 7. Skills Demonstrated

✔ Interface + modports
✔ Driver / Monitor / Scoreboard architecture
✔ Transaction-based checking
✔ Random stimulus generation
✔ Reusable verification components
✔ Professional SystemVerilog TB structure (UVM-like)
✔ Clean modular design