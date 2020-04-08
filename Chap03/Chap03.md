# Chap03

- [Chap03](#chap03)
  - [Contents](#contents)
    - [Notes](#notes)
      - [Registers](#registers)
      - [Operand Specifier](#operand-specifier)
      - [Move Instructions](#move-instructions)
    - [Homework](#homework)

## Contents

This chapter builds around the assemble language, with a subset of x86-64 ISA, y86-64.

For the source code from CS:APP website are too old to build(wasted a lot of time..), I turn to online simulators. Here are the url: [y86.js.org](http://y86.js.org/), [boginw.github.io/js-y86-64/](https://boginw.github.io/js-y86-64/).

Before the homework, there will be some notes about the basic knowledge.

### Notes

#### Registers

![](img/regs.png)

#### Operand Specifier

Instruction set should have access to data stored in registers and memeory, and `Operand` is used to get them to a specific zone for possible use from some instructions.  

Immediate: `$Imm`, you will get the value Imm
Register: `%r`, here %r is a register's name, you will get data stored in `%r`
Memory: find data in memory 
1. `Imm`: data with value of Imm
2. `(%r)`: data at value in reg %r
3. `Imm(%r)`: data at (Imm + %r)
4. `(%ra, %rb)`: data at (%ra + %rb)
5. `Imm(%ra, %rb)`: data at (Imm + %ra + %rb)
6. `(, %r, s)`: data at (s*%r), where s is short for scale
7. `Imm(, %r, s)`: data at (s*%r + Imm)
8. `(%ra, %rb, s)`: data at (%ra + s*%rb)
9. `Imm(%ra, %rb, s)`: data at (Imm + %ra + s*%rb)

#### Move Instructions

`mov_ S D`: _ could be `b`, `w`, `l`, `q`  for different size. There are at least 1 reg in S, D.
`movabsq`
`movz__ S R`: Do zero extension and move.
`movs__ S R`: Do sign extension and move.



### Homework