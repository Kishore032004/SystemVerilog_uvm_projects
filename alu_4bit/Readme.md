# 4-bit Arithmetic Logic Unit (ALU) Design and Verification using Verilog

## 🧠 Overview

This project demonstrates the design and functional verification of a 4-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL. The ALU performs basic arithmetic and logical operations such as Addition, Subtraction, AND, OR, and XOR. A self-checking testbench is used to automatically verify the correctness of the ALU's functionality by comparing DUT outputs against expected values.

---

## 🎯 Project Objectives

- Design a 4-bit ALU using Verilog
- Implement core arithmetic and logical operations
- Develop a combinational testbench that automatically checks DUT correctness
- Generate pass/fail reports for each test case
- Establish a reusable verification setup for small digital modules

---

## 📋 ALU Operation Set

| ALU_Sel | Operation | Description |
| :-----: | :-------- | :---------------------------------- |
| `000` | ADD | Adds A and B, outputs sum and carry |
| `001` | SUB | Subtracts B from A |
| `010` | AND | Bitwise AND |
| `011` | OR | Bitwise OR |
| `100` | XOR | Bitwise XOR |
| Others | Default | Output = 0 |

---

## 💻 Design Code — alu_4bit.v

The DUT is a pure combinational ALU that selects operations based on the 3-bit ALU_Sel signal and outputs a 5-bit result (including carry/borrow flag).

---

## 🧪 Verification Testbench — alu_4bit_tb.v

The testbench implements a self-checking verification approach that:
- Generates all possible input combinations
- Computes expected results
- Compares DUT outputs with expected values
- Reports PASS/FAIL for each test case

---

## 🧾 Simulation Flow

1. Compile both `alu_4bit.v` and `alu_4bit_tb.v` in your Verilog simulator
2. Run the simulation
3. Observe the console output:
   - ✅ PASS → Output matches expected result
   - ❌ FAIL → Mismatch detected
4. All 1280 test cases (16 × 16 × 5) are automatically verified

---

## 🧰 Tools Used

- **Simulator**: ModelSim / Vivado / EDA Playground / Icarus Verilog
- **Language**: Verilog HDL
- **Timescale**: 1 ns / 1 ps

---

## 📊 Expected Output (Example)

```
******* ALU TEST BEGIN *******

✅ PASS: A=5, B=3, SEL=000 | Result={0,1000}
✅ PASS: A=5, B=3, SEL=001 | Result={0,0010}
✅ PASS: A=5, B=3, SEL=010 | Result={0,0001}
✅ PASS: A=5, B=3, SEL=011 | Result={0,0111}
✅ PASS: A=5, B=3, SEL=100 | Result={0,0110}

...

====================================
TEST COMPLETE
Total Tests:  1280
PASSED:       1280
FAILED:       0
====================================
```

---

## 🧠 Learning Outcomes

- Understanding of combinational logic design in Verilog
- Experience in module instantiation and simulation setup
- Skills in writing self-checking verification testbenches
- Exposure to automated testing using loops and case analysis

---

## 🚀 Possible Extensions

- Add more ALU operations (NOT, NAND, NOR, SHIFT, COMPARE)
- Include overflow detection logic
- Implement a scoreboard summary (total pass/fail count)
- Upgrade to SystemVerilog and use assertions or functional coverage

---

## 🎉 Conclusion

This project demonstrates a clean and professional verification methodology for digital designs using Verilog. The self-checking testbench approach eliminates manual result inspection and scales efficiently to verify all 1,280 test cases automatically. The techniques demonstrated here—combinational design, exhaustive testing, and automated checking—form the foundation for verifying more complex digital systems. By establishing this reusable verification framework for a simple ALU, you gain essential skills applicable to real-world hardware verification projects of any complexity.

---

