# Chap 04

- [Chap 04](#chap-04)
  - [Note](#note)
    - [ISA(Instruction-Set Architecture)](#isainstruction-set-architecture)
      - [Programmer Visible State](#programmer-visible-state)
      - [Exceptions](#exceptions)
      - [Sequential CPU](#sequential-cpu)
  - [Single Clock CPU](#single-clock-cpu)
    - [Modules](#modules)

## Note

### ISA(Instruction-Set Architecture)

#### Programmer Visible State

Registers, condition code, memory and status code.

RISC and CISC.

#### Exceptions

Status code: AOK, HLT: ADR

#### Sequential CPU

fetch -> decode -> execute -> memory -> write back -> PC update


## Single Clock CPU

### Modules

- Global Configuration: Config
  - xlen: 64
  - ilen: 32
  - clen: 7
  - r1len: 5
  - r2len: 5
  - wlen: 5
- PC: Reg
- Instruction Memory: InstMem
  - in
    - readAddr
  - out
    - instruction
- Register File: RegFile
  - in
    - r1addr
    - r2addr
    - waddr
    - wdata
  - out
    - r1data
    - r2data
- Immediate Generator: ImmGen
  - in
    - instruction
  - out 
    - imm 
- Control: Control
  - in
    - instruction 6-0
  - out
    - branch
    - memread
    - memtoreg
    - aluop
    - memwrite
    - alusrc
    - regwrite
- ALU: ALU
  - in
    - data1
    - data2
    - ctrl
  - out
    - result
    - zero
- ALU Control: ALUControl
  - instruction 30:14-12
  - ctrl
- Data Memory: MainMem
  - addr
  - wdata
  - rdata