📘 Project Title

4-bit Arithmetic Logic Unit (ALU) Design and Verification using Verilog

🧠 Overview

This project demonstrates the design and functional verification of a 4-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL.
The ALU performs basic arithmetic and logical operations such as Addition, Subtraction, AND, OR, and XOR.
A self-checking testbench is used to automatically verify the correctness of the ALU’s functionality by comparing DUT outputs against expected values.

🎯 Project Objectives

Design a 4-bit ALU using Verilog.

Implement core arithmetic and logical operations.

Develop a combinational testbench that automatically checks DUT correctness.

Generate pass/fail reports for each test case.

Establish a reusable verification setup for small digital modules.

| ALU_Sel | Operation | Description                         |
| :-----: | :-------- | :---------------------------------- |
|  `000`  | ADD       | Adds A and B, outputs sum and carry |
|  `001`  | SUB       | Subtracts B from A                  |
|  `010`  | AND       | Bitwise AND                         |
|  `011`  | OR        | Bitwise OR                          |
|  `100`  | XOR       | Bitwise XOR                         |
| Others  | Default   | Output = 0                          |

💻 Design Code — alu_4bit.v

🧪 Verification Testbench — alu_4bit_tb.v

🧾 Simulation Flow

Compile both alu_4bit.v and alu_4bit_tb.v in your Verilog simulator.

Run the simulation.

Observe the console output:

✅ PASS → Output matches expected result.

❌ FAIL → Mismatch detected.

All 1280 test cases (16 × 16 × 5) are automatically verified.

🧰 Tools Used

Simulator: ModelSim / Vivado / EDA Playground / Icarus Verilog

Language: Verilog HDL

Timescale: 1 ns / 1 ps

📊 Expected Output (Example)

---

******\*\******* ALU TEST BEGIN ****\*\*\*****

---

✅ PASS: A=5, B=3, SEL=000 | Result={0,1000}
✅ PASS: A=5, B=3, SEL=001 | Result={0,0010}
✅ PASS: A=5, B=3, SEL=010 | Result={0,0001}
✅ PASS: A=5, B=3, SEL=011 | Result={0,0111}
✅ PASS: A=5, B=3, SEL=100 | Result={0,0110}
...

---

******\*\******* TEST COMPLETE ****\*\*\*\*****

---

🧠 Learning Outcomes

Understanding of combinational logic design in Verilog.

Experience in module instantiation and simulation setup.

Skills in writing self-checking verification testbenches.

Exposure to automated testing using loops and case analysis.

🚀 Possible Extensions

Add more ALU operations (NOT, NAND, NOR, SHIFT, COMPARE).

Include overflow detection logic.

Implement a scoreboard summary (total pass/fail count).

Upgrade to SystemVerilog and use assertions or functional coverage.

👨‍💻 Author

M. Kishore
Digital Design & Verification Enthusiast
