# Chap02 Representing and Manipulating Information

- [Chap02 Representing and Manipulating Information](#chap02-representing-and-manipulating-information)
  - [Overview](#overview)
  - [Homework Part 1](#homework-part-1)
    - [2.55](#255)
    - [2.57](#257)
    - [2.58](#258)
    - [2.59](#259)
    - [2.60](#260)
  - [Homework Part2](#homework-part2)
    - [2.61](#261)
    - [2.62](#262)
    - [2.63](#263)
    - [2.64](#264)
    - [2.65](#265)

## Overview 
This chapter gives a detailed description of how data is arraged in system.

## Homework Part 1

### 2.55
Compile and run the sample code that uses show_bytes (file show-bytes.c) on
different machines to which you have access. Determine the byte orderings used
by these machines.

> ./code/show_byte.c

### 2.57
Write procedures show_short, show_long, and show_double that print the byte
representations of C objects of types short, long, and double, respectively. Try
these out on several machines.

> ./code/show_type.c

### 2.58
Write a procedure is_little_endian that will return 1 when compiled and run
on a little-endian machine, and will return 0 when compiled and run on a big-
endian machine. This program should run on any machine, regardless of its word
size.

> ./code/is_little_endian.c

### 2.59
Write a C expression that will yield a word consisting of the least significant byte of x and the remaining bytes of y. For operands x = 0x89ABCDEF and y = 0x76543210, this would give 0x765432EF.

> ./code/yield_new_num.c

### 2.60
Suppose we number the bytes in a w-bit word from 0 (least significant) to w/8 − 1 (most significant). Write code for the following C function, which will return an unsigned value in which byte i of argument x has been replaced by byte b: unsigned replace_byte (unsigned x, int i, unsigned char b); Here are some examples showing how the function should work: replace_byte(0x12345678, 2, 0xAB) --> 0x12AB5678 replace_byte(0x12345678, 0, 0xAB) --> 0x123456AB

> ./code/byte_replace.c

## Homework Part2 

Note: 
**Assumptions**
- Integers are represented in two’s-complement form.
- Right shifts of signed data are performed arithmetically.
- Data type int is w bits long. For some of the problems, you will be given a specific value for w, but otherwise your code should work as long as w is a multiple of 8. You can use the expression sizeof(int)<<3 to compute w.

**Forbidden**
- Conditionals (if or ?:), loops, switch statements, function calls, and macro invocations.
- Division, modulus, and multiplication.
- Relative comparison operators (<, >, <=, and >=).
- Allowed operations
- All bit-level and logic operations.
- Left and right shifts, but only with shift amounts between 0 and w − 1.
- Addition and subtraction.
- Equality (==) and inequality (!=) tests. (Some of the problems do not allow these.)
- Integer constants INT_MIN and INT_MAX.
- Casting between data types int and unsigned, either explicitly or implicitly.

### 2.61
Write C expressions that evaluate to 1 when the following conditions are true and to 0 when they are false. Assume x is of type int.
A. Any bit of x equals 1.
B. Any bit of x equals 0.
C. Any bit in the least significant byte of x equals 1.
D. Any bit in the most significant byte of x equals 0.
You may not use equality (==) or inequality (!=) tests.

> ./code/evalute_specific.c

### 2.62
Write  a  functionint_shifts_are_arithmetic()that  yields  1  when  run  on  amachine that uses arithmetic right shifts for data typeintand yields 0 otherwise.Your code should work on a machine with any word size. Test your code on severalmachines.

> ./code/arithmetric.c

### 2.63
Fill in code for the following C functions. Functionsrlperforms a logical rightshift using an arithmetic right shift (given by valuexsra), followed by other oper-ations not including right shifts or division. Functionsraperforms an arithmeticright  shift  using  a  logical  right  shift  (given  by  valuexsrl),  followed  by  otheroperations not including right shifts or division. You may use the computation8*sizeof(int)to determinew, the number of bits in data typeint. The shiftamountkcan range from 0 to w−1

> ./code/srl.c

### 2.64
Write code to implement the following function:
Your function should follow the bit-level integer coding rules (page 164), except that you may assume that data type int has w = 32 bits.

> ./code/odd_ones.c

### 2.65
Write code to implement the following function:
Your code should contain a total of at most 12 arithmetic, bitwise, and logical operations.

> ./code/left_most_ones.c