# 2-bit Comparator Verification (SystemVerilog)

This project implements and verifies a **2-bit Comparator** using a structured SystemVerilog verification environment with modern verification methodologies including interfaces, modports, reference models, and scoreboards.

---

## 📁 Project Structure

### Design Files
| File | Description |
|------|-------------|
| `comparator.sv` | DUT — 2-bit comparator implemented using combinational logic |

### Verification Files
| File | Description |
|------|-------------|
| `comp_interface.sv` | SystemVerilog interface with modports (`dut_mp` for DUT, `tb_mp` for testbench) |
| `tb_comp.sv` | Complete testbench with program block, stimulus generation, reference model, and scoreboard |

---

## 🧩 Design Specification — 2-bit Comparator

### Inputs
- `A` → 2-bit value (`logic [1:0]`)
- `B` → 2-bit value (`logic [1:0]`)

### Outputs
- `LT` → Logic 1 if A < B, otherwise 0
- `EQ` → Logic 1 if A == B, otherwise 0
- `GT` → Logic 1 if A > B, otherwise 0

---

## ⚙️ Verification Architecture

The testbench implements a comprehensive verification flow featuring:

**Interface & Modports**: Encapsulates all DUT signals with separate modports for driver and monitor perspectives

**Program Block**: Contains all testbench logic running in synchronous mode

**Stimulus Generation**: Random test vectors covering all 16 possible 2-bit combinations (10 random iterations shown)

**Reference Model**: Implements the expected behavior for comparison:
```systemverilog
exp_LT = (A <  B);
exp_EQ = (A == B);
exp_GT = (A >  B);
```

**Scoreboard**: Compares actual DUT outputs against expected results and reports PASS/FAIL status

---

## 🔄 Test Flow

1. **Initialization**: DUT and testbench reset to known state
2. **Stimulus Loop**: Generate 10 random test cases
3. **Application**: Drive randomly generated A and B values to DUT
4. **Prediction**: Calculate expected outputs using reference model
5. **Verification**: Compare actual outputs with expected results
6. **Reporting**: Log PASS/FAIL for each test case

### Random Stimulus Generation
```systemverilog
A = $urandom_range(0, 3);  // Generate random 2-bit value (0-3)
B = $urandom_range(0, 3);  // Generate random 2-bit value (0-3)
```

---

## 📤 Example Simulation Output

```
Starting Test of 2-bit Comparator...

[PASS]  A=11 | B=00 | LT=0 EQ=0 GT=1
[PASS]  A=10 | B=01 | LT=0 EQ=0 GT=1
[PASS]  A=10 | B=10 | LT=0 EQ=1 GT=0
[PASS]  A=01 | B=01 | LT=0 EQ=1 GT=0
[PASS]  A=11 | B=11 | LT=0 EQ=1 GT=0
[PASS]  A=00 | B=11 | LT=1 EQ=0 GT=0
[PASS]  A=01 | B=10 | LT=1 EQ=0 GT=0
[PASS]  A=11 | B=10 | LT=0 EQ=0 GT=1
[PASS]  A=00 | B=00 | LT=0 EQ=1 GT=0
[PASS]  A=10 | B=00 | LT=0 EQ=0 GT=1

2-bit Comparator test completed successfully!
Simulation ended at 10 ns with $finish
```

---

## 🛠 Tools & Environment

- **Simulator**: Vivado 2025.1 (XSIM)
- **HDL Language**: SystemVerilog (IEEE 1800-2017)
- **Verification Methodology**: UVM-inspired structured approach

---

## 🎓 Key Learning Outcomes

This project demonstrates several industry-standard verification concepts:

- **Interface Design**: Proper encapsulation of design signals using SystemVerilog interfaces
- **Modports**: Separate viewpoints for DUT and testbench components
- **Program Blocks**: Synchronous execution model for deterministic testbench behavior
- **Reference Models**: Behavioral specification for automated result checking
- **Scoreboards**: Efficient pass/fail tracking and reporting
- **Constrained Randomization**: Systematic coverage of input space

---

## 🎉 Conclusion

This project demonstrates a clean, professional, and scalable verification methodology for digital designs. The structured approach using interfaces, modports, program blocks, reference models, and scoreboards represents best practices in modern hardware verification and provides a solid foundation for more complex verification challenges.

The 2-bit comparator serves as an excellent learning vehicle for understanding fundamental verification concepts that scale to real-world designs of any complexity.

---

## 📝 Future Enhancements

- Extend to N-bit comparators with parameterized interfaces
- Add formal verification (SVA assertions)
- Implement coverage metrics
- Migrate to UVM for larger designs
- Add performance analysis and metrics reporting

---

**Thank you for exploring this verification project!**  
Feel free to use this as a reference, fork it, or adapt it for your own verification needs.
