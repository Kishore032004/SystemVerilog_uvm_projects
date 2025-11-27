# Full Adder Verification – SystemVerilog (Vivado Simulator)

## 🧠 Overview

This project implements and verifies a 1-bit Full Adder using a structured SystemVerilog testbench. It extends the concepts used in the Half Adder Verification project and introduces verification for a slightly more complex combinational circuit. The testbench uses interfaces, program blocks, self-checking logic, and exhaustive directed testing with a Vivado-friendly simulation flow.

---

## 📘 Project Overview

A Full Adder adds three 1-bit inputs:
- `A` → First operand
- `B` → Second operand
- `Cin` → Carry-in

And produces two outputs:
- `SUM` → Sum output
- `Cout` → Carry-out

This design verifies all 8 input combinations and checks correctness using a self-checking structured testbench.

---

## 🔧 File Structure

```
FullAdder_Verification/
│
├── full_adder.sv          DUT (Design Under Test)
├── full_adder_if.sv       Interface for signal bundling
└── tb_full_adder.sv       Testbench (includes program block)
```

---

## 📐 Design Overview

The Full Adder implements two-level addition:

1. First add A and B (half add)
2. Then add Cin
3. Produce:
   - `SUM` (final LSB)
   - `Cout` (final carry-out)

The logic is fully combinational and does not require clocks or resets.

---

## 🧩 Interface Overview

The interface contains all DUT I/O signals:
- `A`
- `B`
- `Cin`
- `SUM`
- `Cout`

**Purpose:**
- Bundles all signals into a single handle
- Provides cleaner wiring
- Enables easy access for the test program
- Keeps testbench modular and scalable

---

## 🧪 Testbench Overview

The structured SystemVerilog testbench includes:

**✔ Interface Instance**
Connects signals between DUT and TB.

**✔ DUT Instance**
Wired using the interface.

**✔ Program Block**
Contains the entire verification sequence, including:
- Loop over all 8 input combinations
- Expected value computation for SUM and Cout
- Self-checking logic using comparisons
- PASS/ERROR logging
- Simulation termination with $finish

**✔ Vivado Compatibility**
No $dumpvars or $dumpfile needed—Vivado Simulator automatically generates .wdb waveform files.

---

## 🎯 Verification Methodology

This testbench verifies the Full Adder using:

**✔ Directed Exhaustive Testing**
All 8 combinations of (A, B, Cin) are tested.

**✔ Self-Checking**
Expected values for SUM and Cout are computed inside the program block and compared with DUT outputs.

**✔ Structured Testbench Architecture**
Testbench → Interface → DUT → Program block, just like verification done in industry.

---

## 🖥️ Running Simulation in Vivado

**Steps:**

1. Create a new Vivado project
2. Add files:
   - `full_adder.sv` → Design Sources
   - `full_adder_if.sv` → Simulation Sources
   - `tb_full_adder.sv` → Simulation Sources
3. Run:
   - Flow → Run Simulation → Run Behavioral Simulation
4. View PASS/ERROR results in the simulation console
5. Add signals to the waveform window if needed
6. Vivado will automatically produce .wdb waveform files

---

## 📊 Expected Simulation Output (Console)

You will see PASS messages for all 8 test cases, such as:

```
[PASS] A=0 B=0 Cin=0 | SUM=0 Cout=0
[PASS] A=0 B=0 Cin=1 | SUM=1 Cout=0
[PASS] A=0 B=1 Cin=0 | SUM=1 Cout=0
[PASS] A=0 B=1 Cin=1 | SUM=0 Cout=1
[PASS] A=1 B=0 Cin=0 | SUM=1 Cout=0
[PASS] A=1 B=0 Cin=1 | SUM=0 Cout=1
[PASS] A=1 B=1 Cin=0 | SUM=0 Cout=1
[PASS] A=1 B=1 Cin=1 | SUM=1 Cout=1

Test been completed
$finish called at time : 8 ns
```

---

## 🧰 Tools Used

- **Simulator**: Vivado 2025.1 (XSIM)
- **Language**: SystemVerilog (IEEE 1800-2017)
- **Design Type**: Combinational logic

---

## 🎓 What You Learn

By completing this Full Adder verification, you learn:

- How to extend structured testbenches to more complex logic
- How to apply interface-based connectivity
- How to use program blocks reliably in Vivado
- How to perform exhaustive directed verification
- How to compute expected values for multi-input combinational logic
- How to design reusable and scalable TB structures

---

## 🎉 Conclusion

This project demonstrates a clean and professional verification methodology for combinational circuits using SystemVerilog. By applying structured testbench principles to the Full Adder design, the project showcases how interfaces, program blocks, and self-checking logic work together to create maintainable and scalable verification environments. The exhaustive directed testing approach ensures all corner cases are covered, building confidence in the design's correctness. These techniques—modular interfaces, systematic stimulus generation, and automated checking—form the foundation for verifying more complex digital systems and represent industry best practices for hardware verification.

---


**Thank you for exploring this verification project!**  
Feel free to explore, fork, or improve it further.
