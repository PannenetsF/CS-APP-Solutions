# Chap03

- [Chap03](#chap03)
  - [Contents](#contents)
    - [Notes](#notes)
      - [Registers](#registers)
      - [Operand Specifier](#operand-specifier)
      - [Move Instructions](#move-instructions)
        - [Pushing and Popping Stack Data](#pushing-and-popping-stack-data)
      - [Arithmetic and Logical Operations](#arithmetic-and-logical-operations)
        - [Load effective address](#load-effective-address)
        - [Unary and Binary Operations](#unary-and-binary-operations)
      - [Controll Structure](#controll-structure)
        - [Condition Code](#condition-code)
        - [Access to condition codes](#access-to-condition-codes)
        - [Jump](#jump)
        - [Conditional Move](#conditional-move)
        - [Loop](#loop)
        - [Switch](#switch)
      - [Procedures](#procedures)
        - [Runtime Stack](#runtime-stack)
        - [Controll Transfer](#controll-transfer)
        - [Data Transfer](#data-transfer)
        - [Local Storage on the stack](#local-storage-on-the-stack)
        - [Local Storage in the regs](#local-storage-in-the-regs)
        - [Recursive](#recursive)
      - [Array Allocation and access](#array-allocation-and-access)
        - [Rules](#rules)
        - [Operations](#operations)
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

##### Pushing and Popping Stack Data
These operations are aiming at push and pop data into or from stack register `%rsp`.

`pushq S`: push a 64-bit data into **memory** at R[%rsp] and the R[%rsp] decreases by 8.
`popq D`: pop a 64-bit data from **memory** at R[%rsp] and the R[%rsp] increase by 8.
Note the stack is growing downward.

#### Arithmetic and Logical Operations

##### Load effective address
`leaq S D`: this take the address of S and store it in D.
`leaq` can be used in simple add operations, for example.
```asm
// x in %rdi y in %rsi
leaq    (%rdi, %rsi, 4), %rax
```
`(%rdi, %rsi, 4)` refers to the memory at (%rdi + 4 * %rsi), so in fact this make %rax store the (x + 4 * y)

##### Unary and Binary Operations
**Note**: instructions below are described in a single class with different operands and the end of them vary from 'b', 'w', 'l', 'q'

Unary operations' source is the same as it's destination.

`inc_ D`: D <- D+1
`dec_ D`: D <- D-1
`neg_ D`: D <- -D
`not_ D`: D <- ~D

Binary operations

`add_ S D`: D <- S + D
Generalized to `sub` `imul` `xor` `or` `and`

Shift operations

`sal_ k D`: D <- D << k (logic)
`shl_ k D`: D <- D << k (arithmeic)
`sar_ k D`: D <- D >> k (logic)
`shr_ k D`: D <- D >> k (arithmeic)

Multiply and divide of Oct word.
`imulq S`: (R[%rdx], R[%rax]) <- S * R[%rax] (signed)
`mulq S`: (R[%rdx], R[%rax]) <- S * R[%rax] (unsigned)

`clto`: (R[%rdx], R[%rax]) <- Signed Extend R[%rax]

`idivq S`: (R[%rdx], R[%rax]) <- S / R[%rax] (signed)
`divq S`: (R[%rdx], R[%rax]) <- S / R[%rax] (unsigned) 
R[%rdx] gets the mod, and R[%rax] gets the ans.

#### Controll Structure

##### Condition Code

`CF`: Carry Flag. To check if carry occurs in recent operation.
`ZF`: Zero Flag. The most recent operation yielded zero.
`SF`: Sign Flag. Negative value generated.
`OF`: Overflow Flag.

**Note**: Arithmetic operations will set flags while something like `;eaq` won't.

Some operations alert the flag registers only:
`cmp_ s1, s2`: check the value of (s2 - s1).

Let's have a look:
```c
case(s2-s1):
  == 0: ZF = 1; SF = 0;
  <0:   SF = 1; ZF = 0;
  >0:   SF = 0; ZF = 0;
```

`test_ s1, s2`: check the value of (s2 & s1).

##### Access to condition codes

Conditional Set: Only to the low-order byte.
`set_`
The suffix vary from the first character of equal, not equal, signed, not signed, greater, not greater...
![](img/set.png)

##### Jump

With `jump` you can realize loop and switch and recursion.
`jmp .lable`: jump to a place named `.lable` unconditionally.
`jmp *%reg`: jump to certain memory
`jmp *(%reg)`: jump to some register

And jump in some condition:
![](img/jmp.png)

##### Conditional Move
Move some data with conditional codes.

And in most cases, conditional move are better than conditional jump.

-[](img/cmov.png)

##### Loop

With jump and conditional codes, loop is easy to implement. 

##### Switch

First you compute the statement to be used, and then treat it as an index of `jmp`.

The index uses the concept of jump table.

```asm
  .section    .rodata
  .align      8
.L4:
  .quad       .L3
  .quad       .L5
  .quad       .L6
```

And you can the index in this way:

```
jmp   *.L4(, %rsi, 8)
```

#### Procedures

A procedure can be simply considered as a function. 
- Before the machine handle the function the PC gets the function's address. After calling, the PC gets the address after it.
- Functions may have some parameters and may return a value.
- Fuctions should be able to allocate and deallocate memory.

##### Runtime Stack

If the space in registers cannot meet the need of procedure, it will allocate some memory in stack, which is called stack fram.

If a procedure Q is called in a procedure P, the cpu will push the return address into stack to imply where P should continue.

##### Controll Transfer

If calling sth, the stack address will decrease by 8 or more. After that, resume the origin address.

##### Data Transfer

With specific registers, we can transfer data into procedure.

![](img/para_reg.png)

If too many parameters needed that registers are not enough, we need stack for para_7 to para_n. And para_7 is at stack top.


##### Local Storage on the stack

When the regs are not enough for paras, we need  stack to hold local varibles.

When you call it, it will allocate some space on the stack, and it will be freed after call.

##### Local Storage in the regs

The regs are the only to be shared to any procedure.

So what's the difference between `callee-saved` and `caller saved`?

`callee-saved` means that, if you call a procedure and you have to use some regs, you should save the origin value to stack and restore it after call.

`caller-saved` means you cannot ask the callee to do the job, you should do it yourself.

##### Recursive

It's almost the same with loop in asm. But recursive procedure will have a large stack usage.

#### Array Allocation and access

##### Rules

As we know data type has size varying from 8, 16, 32, 64, and the nature of an array is address and bias.

You can simply store the base address, the use the `(%reg1, %reg2, scale)` manner to access an element.

##### Operations

Apply `mov_` and `leaq` to get a pointer.
Apply `(%reg, %reg, scale)` to get a pointer dereference.




### Homework