🧠 Asynchronous RAM (Random Access Memory) in Verilog
This repository contains a Verilog-based design and testbench for modeling a simple asynchronous RAM module. It is designed to simulate basic memory read/write behavior without the use of a clock, allowing learners and engineers to better understand low-level memory interactions.

📌 Key Highlights
Asynchronous read and write operations (no clock signal used)

1024 memory locations (address space: 10-bit wide)

8-bit data width per memory word

Controlled by cs (chip select) and wr (write enable) signals

Outputs high impedance (Z) when not enabled

Fully testable using a simple Verilog testbench

🧩 Module Overview: ram_3
The ram_3 module is a parameterized RAM model built to simulate basic read and write behavior asynchronously.

📥 Inputs and Outputs
Port	| Direction |	Width |	Description
data_in | Input |	8 bits |	Input data to be written to memory
addr |	Input |	10 bits |	Address to read from or write to (0–1023)
wr |	Input |	1 bit |	Write enable (active high)
cs |	Input |	1 bit	| Chip select (active high)
data_out |	Output |	8 bits |	Output data from the selected memory address

⚙️ Functional Behavior
When cs = 1 and wr = 1:

The value on data_in is written to memory at address addr.

When cs = 1 and wr = 0:

The content of mem[addr] is driven onto data_out.

When cs = 0:

data_out is placed in high impedance (Z) state, indicating the module is inactive.

🛠 Internal Memory
Internal memory is declared as:

reg [7:0] mem [0:1023];  // 1024 memory words of 8 bits each

🧪 Testbench: ram_tb
The testbench.v file provides a comprehensive simulation environment to verify the RAM's functionality. It performs the following:

🧾 Test Flow
Initialization:

The RAM is filled with data using the pattern (i * 3) % 256.

Write operations are performed asynchronously.

Random Access Reads:

10 random addresses are selected using $random.

Each address is read and the result is displayed.

Simulation Timing:

A #1 delay is used to separate events and simulate propagation time.

<img width="1561" height="848" alt="image" src="https://github.com/user-attachments/assets/84bcb43d-7c06-4f45-aeb2-131363a231af" />


💡 Why Asynchronous RAM?
While synchronous RAMs are widely used in digital systems with clock control, asynchronous RAMs are:

Simpler to simulate

Useful for small buffers, caches, or peripherals

Ideal for modeling low-level memory behavior

Helpful for understanding how memory-mapped hardware works in embedded systems
