# Half Adder Verification – SystemVerilog (Vivado Simulator)

## 🧠 Overview

This project implements and verifies a 1-bit Half Adder using a structured SystemVerilog testbench. The Half Adder is a fundamental combinational circuit that adds two 1-bit inputs and produces a sum and carry output. The testbench uses interfaces, program blocks, self-checking logic, and exhaustive directed testing with a Vivado-friendly simulation flow.

---

## 📘 Project Overview

A Half Adder adds two 1-bit inputs:
- `A` → First operand
- `B` → Second operand

And produces two outputs:
- `SUM` → Sum output
- `CARRY` → Carry output

This design verifies all 4 input combinations and checks correctness using a self-checking structured testbench.

---

## 🔧 File Structure

```
HalfAdder_Verification/
│
├── half_adder.sv          DUT (Design Under Test)
├── half_adder_if.sv       Interface for signal bundling
└── tb_half_adder.sv       Testbench (includes program block)
```

---

## 🧩 Design Overview

The Half Adder implements simple dataflow logic:

```
SUM = A XOR B
CARRY = A AND B
```

Pure combinational circuit with no clock or reset required.

---

## 🧩 Interface Overview

Bundles the following signals:
- `A`
- `B`
- `SUM`
- `CARRY`

**Purpose:**
- Simplifies wiring between DUT and testbench
- Provides a clean handle for program block access
- Keeps testbench modular and scalable

---

## 🧪 Testbench Overview

The structured SystemVerilog testbench:

- Instantiates the interface
- Instantiates the DUT and connects through the interface
- Runs a program block that:
  - Applies all 4 combinations of A & B
  - Computes expected SUM and CARRY
  - Compares with DUT output
  - Prints PASS/ERROR messages
  - Ends the simulation gracefully

**Vivado Compatibility:**
No $dumpvars or $dumpfile is used — Vivado captures waveform .wdb automatically.

---

## 🎯 Verification Methodology

This testbench verifies the Half Adder using:

**✔ Exhaustive Directed Testing**
All 4 combinations of (A, B) are tested.

**✔ Self-Checking**
Expected values for SUM and CARRY are computed inside the program block and compared with DUT outputs.

**✔ Structured Testbench Architecture**
Testbench → Interface → DUT → Program block, representing industry standard practices.

---

## 🖥️ Running Simulation in Vivado

**Steps:**

1. Create a new Vivado project
2. Add files:
   - `half_adder.sv` → Design Sources
   - `half_adder_if.sv` → Simulation Sources
   - `tb_half_adder.sv` → Simulation Sources
3. Run:
   - Flow → Run Simulation → Run Behavioral Simulation
4. Observe PASS/FAIL logs in console
5. Optionally add signals to waveform window

---

## 📊 Expected Output (Console)

PASS messages for all 4 combinations, ending with:

```
[PASS] A=0 B=0 | SUM=0 CARRY=0
[PASS] A=0 B=1 | SUM=1 CARRY=0
[PASS] A=1 B=0 | SUM=1 CARRY=0
[PASS] A=1 B=1 | SUM=0 CARRY=1

Test been completed
$finish called at time : 4 ns
```

---

## 🧰 Tools Used

- **Simulator**: Vivado 2025.1 (XSIM)
- **Language**: SystemVerilog (IEEE 1800-2017)
- **Design Type**: Combinational logic

---

## 🎓 What You Learn

By completing this Half Adder verification, you learn:

- How structured SystemVerilog testbenches work
- Testbench → Interface → DUT connection flow
- How program blocks avoid race conditions
- How self-checking logic validates design correctness
- How to run behavioral simulations in Vivado
- How to organize verification projects cleanly
- How to apply industry-standard practices to simple designs

---

## 🎉 Conclusion

This project demonstrates a clean and professional verification methodology for fundamental combinational circuits using SystemVerilog. By applying structured testbench principles to the Half Adder design, the project showcases how interfaces, program blocks, and self-checking logic work together to create maintainable and scalable verification environments. The exhaustive directed testing approach ensures all corner cases are covered, building confidence in the design's correctness. These techniques—modular interfaces, systematic stimulus generation, and automated checking—form the foundation for verifying more complex digital systems and represent industry best practices for hardware verification.


**Thank you for exploring this verification project!**  
Feel free to explore, fork, or improve it further.
