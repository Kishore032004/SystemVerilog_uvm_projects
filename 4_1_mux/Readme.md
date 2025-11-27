# 4:1 Multiplexer Verification (SystemVerilog)

This project implements a comprehensive verification environment for a **4:1 Multiplexer** using industry-standard SystemVerilog verification architecture. The testbench demonstrates professional verification practices with modular, reusable components including a driver, monitor, scoreboard, and transaction-based checking.

---

## 📌 Design Specification — 4:1 Multiplexer

### Functional Behavior

The 4:1 MUX selects one of four 1-bit inputs based on a 2-bit select line and outputs the selected value:

| Select (S) | Output (Y) |
|:----------:|:----------:|
| `2'b00` | D0 |
| `2'b01` | D1 |
| `2'b10` | D2 |
| `2'b11` | D3 |

### Port Description

**Inputs:**
- `D0, D1, D2, D3` → 1-bit data inputs
- `S[1:0]` → 2-bit select line

**Outputs:**
- `Y` → 1-bit multiplexed output

### Implementation
- **Logic Type**: Combinational
- **Design File**: `mux4to1.sv`

---

## 🏗️ Verification Architecture

The verification environment follows a modular, component-based architecture inspired by industry-standard methodologies:

```
       ┌─────────────┐        ┌──────────┐        ┌──────────────┐
       │   DRIVER    │───────▶│   DUT    │───────▶│   MONITOR    │
       │ (Stimulus)  │        │ 4:1 MUX  │        │  (Capture)   │
       └─────────────┘        └──────────┘        └──────────────┘
                                                         │
                                                         │ Transaction
                                                         ▼
                                                  ┌──────────────────┐
                                                  │  SCOREBOARD      │
                                                  │  (Golden Model)  │
                                                  │  (Comparison)    │
                                                  └──────────────────┘
```

### Component Responsibilities

**Driver** (`driver.sv`)
- Generates random stimulus for all inputs (D0–D3, S)
- Applies inputs to DUT through the interface
- Maintains synchronization with simulation clock
- Enables controlled, repeatable test patterns

**Monitor** (`monitor.sv`)
- Passively observes DUT inputs and output
- Samples signals on every clock cycle
- Packages observations into transaction structures
- Feeds transactions to the scoreboard
- Does not modify DUT behavior

**Scoreboard** (`scoreboard.sv`)
- Computes expected output using golden reference model
- Compares expected vs actual DUT output
- Maintains per-cycle statistics and counters
- Logs PASS/ERROR messages with detailed information
- Provides final test summary

**Interface + Modports** (`mux_if.sv`)
- Encapsulates all DUT signals
- Provides separate perspectives via modports
- `dut_mp` → For DUT instantiation
- `tb_mp` → For testbench (driver/monitor) access
- Enables clean signal connectivity and type safety

**Program Block** (`test.sv`)
- Orchestrates driver, monitor, and scoreboard
- Coordinates stimulus generation and checking flow
- Manages simulation phases (reset, run, finish)
- Provides synchronized test execution

**Top Testbench** (`mux_tb.sv`)
- Instantiates interface, DUT, and program block
- Generates simulation clock
- Provides hierarchical top-level module

---

## 📁 File Structure

```
mux_project/
│
├── mux4to1.sv           DUT — 4:1 multiplexer (combinational logic)
├── mux_if.sv            Interface with modports (dut_mp, tb_mp)
├── driver.sv            Generates and applies random stimulus
├── monitor.sv           Samples and packages observations
├── scoreboard.sv        Golden model and result checking
├── test.sv              Program block (orchestration)
└── mux_tb.sv            Top testbench (hierarchy)
```

**Design Principle**: Each file has a single, well-defined responsibility enabling modularity, reusability, and scalability.

---

## 📦 Transaction Format

All observations are encapsulated in a standardized transaction struct for clean, type-safe communication:

```systemverilog
typedef struct {
    bit D0;              // Data input 0
    bit D1;              // Data input 1
    bit D2;              // Data input 2
    bit D3;              // Data input 3
    bit [1:0] S;         // Select line
    bit Y;               // Multiplexed output
} mux_trans_t;
```

**Data Flow**: Monitor samples → Creates transaction → Passes to Scoreboard

---

## 🔍 Golden Reference Model

The scoreboard implements the expected behavior using a combinational model:

```systemverilog
case (tr.S)
    2'b00: expected = tr.D0;
    2'b01: expected = tr.D1;
    2'b10: expected = tr.D2;
    2'b11: expected = tr.D3;
endcase
```

**Verification Logic**:
```systemverilog
if (tr.Y !== expected) begin
    $display("[ERROR] S=%h | D=%b%b%b%b | Expected=%b | Got=%b", 
             tr.S, tr.D3, tr.D2, tr.D1, tr.D0, expected, tr.Y);
    error_count++;
end else begin
    $display("[PASS]  S=%h | D=%b%b%b%b | Y=%b", 
             tr.S, tr.D3, tr.D2, tr.D1, tr.D0, tr.Y);
    pass_count++;
end
```

---

## 🧪 Simulation Flow

1. **Initialization** — Reset all components and DUT
2. **Stimulus Generation** — Driver creates random test vectors
3. **Application** — Driver applies D0–D3 and S to DUT inputs
4. **Observation** — Monitor samples all signals after propagation
5. **Prediction** — Scoreboard computes expected Y from golden model
6. **Verification** — Scoreboard compares expected vs actual
7. **Reporting** — Log PASS/FAIL with full transaction details
8. **Repetition** — Cycle repeats for configurable test iterations
9. **Summary** — Final statistics and test completion message

---

## 📤 Example Simulation Output

```
===============================================
Starting 4:1 Multiplexer Verification...
===============================================

[PASS]  S=0 | D=1001 | Y=1
[PASS]  S=1 | D=0110 | Y=1
[PASS]  S=2 | D=0101 | Y=0
[PASS]  S=3 | D=1010 | Y=0
[PASS]  S=0 | D=1100 | Y=0
[PASS]  S=1 | D=0011 | Y=1
[PASS]  S=2 | D=1110 | Y=1
[PASS]  S=3 | D=0001 | Y=1
[PASS]  S=0 | D=1111 | Y=1
[PASS]  S=1 | D=0000 | Y=0

===============================================
Test Summary:
Total Tests:  10
PASSED:       10
FAILED:       0
===============================================
4:1 Multiplexer Verification Completed Successfully!
Simulation ended at 20 ns with $finish
```

---

## 🛠️ Tool Setup & Execution

### Prerequisites
- **Simulator**: Vivado 2025.1 (XSIM)
- **Language**: SystemVerilog (IEEE 1800-2017)
- **OS**: Windows, Linux, or macOS

### Running the Simulation

1. **Create Project**
   ```
   Open Vivado → Create New Project → Select RTL
   ```

2. **Add Source Files**
   - Add all `.sv` files to Simulation Sources
   - Set file compilation order:
     1. `mux_if.sv` (interface first)
     2. `driver.sv`
     3. `monitor.sv`
     4. `scoreboard.sv`
     5. `test.sv`
     6. `mux4to1.sv`
     7. `mux_tb.sv`

3. **Configure Simulation**
   - Right-click on `mux_tb` → Set as Top
   - Simulation Settings → Set runtime (e.g., 100 ns)

4. **Run Simulation**
   ```
   Run Behavioral Simulation
   ```

5. **View Results**
   - Check Tcl Console for test output
   - Verify `[PASS]` messages for all transactions
   - Confirm final test summary

---

## 🎓 Verification Concepts Demonstrated

This project showcases professional verification practices:

✔ **Interface Design** — Encapsulation of design signals using SystemVerilog interfaces  
✔ **Modports** — Separate port sets for different component perspectives  
✔ **Driver Component** — Controlled stimulus generation and synchronization  
✔ **Monitor Component** — Non-intrusive observation and transaction packaging  
✔ **Scoreboard Component** — Golden model implementation and automated checking  
✔ **Transaction-Based Verification** — Structured data flow between components  
✔ **Random Stimulus** — Systematic exploration of input space  
✔ **Combinational Logic Verification** — Testing designs without sequential behavior  
✔ **Modular Architecture** — Reusable, scalable verification components  
✔ **UVM-Inspired Structure** — Industry-standard testbench organization  

---

## 🚀 Scalability & Future Enhancements

**Immediate Extensions:**
- Parameterize for N:1 multiplexers (any width, any number of inputs)
- Add weighted constrained randomization for targeted stimulus
- Implement functional coverage metrics

**Advanced Features:**
- Migrate to UVM methodology for enterprise-scale verification
- Add assertions (SVA) for continuous property checking
- Implement cross-coverage analysis
- Add performance and timing analysis
- Create self-checking test sequences

**Learning Path:**
- Master this 4:1 MUX baseline
- Apply patterns to larger combinational designs
- Extend to sequential designs (FIFOs, controllers, etc.)
- Graduate to UVM for real-world projects

---

## 📋 Checklist — Verification Best Practices

This project implements several industry best practices:

- ✅ Clear component separation of concerns
- ✅ Transaction-based communication between components
- ✅ Golden reference model for expected behavior
- ✅ Comprehensive error reporting and diagnostics
- ✅ Type-safe data structures (structs, enums)
- ✅ Reusable, parameterizable interfaces
- ✅ Deterministic yet randomized stimulus
- ✅ Professional code organization and documentation
- ✅ Scalable architecture supporting multiple test iterations
- ✅ Clean final reporting and test summary

---

## 🎉 Conclusion

This 4:1 Multiplexer verification project demonstrates a sophisticated, professional-grade verification environment scaled appropriately for the design complexity. By implementing driver, monitor, and scoreboard components with transaction-based communication, the project introduces industry-standard practices that form the foundation of enterprise-scale verification methodologies.

The modular architecture ensures that each component can be independently developed, tested, and reused. This clean separation of concerns makes the testbench maintainable, extensible, and serves as an excellent learning vehicle for understanding how larger verification frameworks are structured.

The techniques demonstrated here—interfaces, modports, random stimulus generation, golden models, and automated checking—are directly applicable to verifying real-world designs of any complexity, from simple combinational circuits to complex SoCs.

---

## 📚 Key Takeaways

- Verification is as important as design
- Modular architecture scales with design complexity
- Golden models enable automated, objective checking
- Transaction-based flow simplifies component integration
- Random stimulus provides comprehensive coverage
- Professional organization enables team collaboration

---

**Thank you for exploring this verification project!**  
Use this as a reference, adapt it to your designs, or extend it with advanced features. Happy verifying! 🎯
