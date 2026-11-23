# Computer Organization and Architecture (COA) Lab

Solutions and lab assessment exercises for Computer Organization and Architecture coursework. Contains implementations in 64-bit Linux NASM assembly and 16-bit 8086 MASM/DOS assembly.

---

## Repository Structure

```
.
├── lab1.asm                      # x86-64 NASM: basic arithmetic (add, sub) and stdout
├── lab2.asm                      # x86-64 NASM: reverse 3-character input down left margin
├── lab3.asm                      # 8086 MASM: JMP branching and arithmetic (5 + 3 - 2 + 1)
├── lab4.asm                      # 8086 MASM: 2's complement negation (NEG) and arithmetic
├── lab-assesment/                # Assessment question briefs and target output references
│   ├── lab2.png                  # Assessment prompt: reverse 3 initials
│   ├── lab3.jpeg                 # Assessment prompt: JMP and arithmetic
│   └── lab3-2.jpeg               # Reference output for Lab 3
├── screenshots/                  # Verified execution screenshots
│   ├── lab1.png
│   ├── lab2.png
│   ├── lab3.png
│   └── lab4.png
├── .vscode/                      # VS Code emulator/assembler workspace configuration
│   ├── extensions.json
│   └── settings.json
└── COA MID QUESTION Fall 2025-26.pdf # Course midterm reference question paper
```

---

## Lab Details

### Lab 1: Basic Arithmetic Operations
- **File:** `lab1.asm`
- **Target:** x86-64 Linux (NASM)
- **Description:** Performs addition and subtraction on two single-digit numeric literals (`num1 = 4`, `num2 = 3`) using register operations, converts results to ASCII digits, and writes formatted labels and values to standard output via 64-bit Linux syscalls (`sys_write`, `sys_exit`).
- **Expected Output:**
  ```text
  First Number is: 4
  Second Number is: 3
  Sum is: 7
  Subtraction is: 1
  ```

### Lab 2: Reverse 3-Character Input
- **File:** `lab2.asm`
- **Target:** x86-64 Linux (NASM)
- **Description:** Solves assessment task 1 (`lab-assesment/lab2.png`). Reads up to 3 characters from standard input (`sys_read`), strips trailing line terminators (LF/CR), and prints the characters in reverse order down the left margin separated by newlines.
- **Example:**
  ```text
  Input:  JFK
  Output:
  K
  F
  J
  ```

### Lab 3: Unconditional Jump and Expression Evaluation
- **File:** `lab3.asm`
- **Target:** 16-bit 8086 Real Mode / DOS (MASM / TASM)
- **Description:** Solves assessment task 2 (`lab-assesment/lab3.jpeg`). Demonstrates control flow using unconditional jump (`JMP`) to skip execution of a second message string, computes the expression `5 + 3 - 2 + 1 = 7` using `ADD`, `SUB`, and `INC`, and prints the messages and ASCII result via DOS interrupts (`INT 21H`, AH=09H and AH=02H).
- **Expected Output:**
  ```text
  First Message Printed
  Final Result = 7
  ```

### Lab 4: Two's Complement Negation and Multi-step Arithmetic
- **File:** `lab4.asm`
- **Target:** 16-bit 8086 Real Mode / DOS (MASM / TASM)
- **Description:** Implements sequential arithmetic flow using `JMP` labels. Adds two numbers (`5 + 3 = 8`), computes the two's complement of the third number (`2` -> `-2`) using `NEG`, adds the negated value (`8 + (-2) = 6`), and prints each step with descriptive string labels.
- **Expected Output:**
  ```text
  First Number: 5
  Second Number: 3
  Third Number: 2
  Sum of First Two: 8
  Negative of Third: 2
  Final Result: 6
  ```

---

## Build and Execution

### 1. Linux x86-64 Programs (`lab1.asm`, `lab2.asm`)

Prerequisites: `nasm`, `ld` (GNU binutils).

Assemble, link, and run:
```bash
# Lab 1
nasm -f elf64 lab1.asm -o lab1.o
ld lab1.o -o lab1
./lab1

# Lab 2
nasm -f elf64 lab2.asm -o lab2.o
ld lab2.o -o lab2
./lab2
```

### 2. 16-bit 8086 Programs (`lab3.asm`, `lab4.asm`)

Prerequisites: DOSBox, EMU8086, or the VS Code `masmtasm` extension.

#### Using VS Code (`masmtasm` extension)
The repository includes workspace settings in `.vscode/settings.json`:
- Assembler: `MASM-v6.11`
- Emulator: `jsdos-x`
- Shortcut: Open `.asm` file and run `Ctrl+Shift+F5` (assemble and run) or `Ctrl+F5` (debug).

#### Using DOSBox + MASM CLI
```text
masm lab3.asm;
link lab3.obj;
lab3.exe
```
