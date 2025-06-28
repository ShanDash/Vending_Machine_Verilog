# Vending_Machine_Verilog

This project implements a simple **Finite State Machine (FSM)** model for a vending machine using Verilog HDL.  
The vending machine sells a chocolate worth **₹15**. A customer can insert coins worth either **₹5** or **₹10** only.

- If the total inserted amount reaches ₹15, the machine **dispenses the chocolate**.
- If the total exceeds ₹15, the machine returns the **extra amount as change**.
- If the customer cancels mid-way (by not inserting more coins), the machine returns **all deposited coins**.

The FSM uses 3 states:
- `s0` → ₹0 inserted
- `s1` → ₹5 inserted
- `s2` → ₹10 inserted

---

## 🛠️ Files

- `vending_machine.v`  
  Main FSM module: implements state transitions and output logic.
- `tb_vending_machine.v`  
  Testbench: generates clock, applies coin inputs, and monitors outputs.

---

## ✅ Features

- **Synchronous FSM**: driven by a single clock.
- Supports valid coin inputs: `2'b01` (₹5) or `2'b10` (₹10).
- Handles **intermediate cancellation**: returns inserted coins if no input.
- Outputs:
  - `done`: chocolate dispensed flag
  - `change`: amount of change returned (₹0, ₹5, or ₹10)

---
