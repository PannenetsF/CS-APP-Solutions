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
    - [2.66](#266)
    - [2.67](#267)
    - [2.68](#268)
    - [2.69](#269)
    - [2.70](#270)
    - [2.71](#271)
    - [2.72](#272)
    - [2.73](#273)
    - [2.74](#274)
    - [2.75](#275)
    - [2.76](#276)
    - [2.77](#277)
    - [2.78](#278)
    - [2.79](#279)
    - [2.80](#280)

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

> ./code/any_odd_one.c

### 2.65
Write code to implement the following function:
Your code should contain a total of at most 12 arithmetic, bitwise, and logical operations.

> ./code/odd_ones.c

### 2.66

> ./code/left_most_ones.c

### 2.67
You are given the task of writing a procedure int_size_is_32() that yields 1 when run on a machine for which an int is 32 bits, and yields 0 otherwise. You are not allowed to use the sizeof operator. Here is a first attempt:
```c
/* The following code does not run properly on some machines */
int bad_int_size_is_32() 
{
/* Set most significant bit (msb) of 32-bit machine */
int set_msb = 1 << 31;
/* Shift past msb of 32-bit word */
int beyond_msb = 1 << 32;
/* set_msb is nonzero when word size >= 32
beyond_msb is zero when word size <= 32 */
return set_msb && !beyond_msb;

}
```
When compiled and run on a 32-bit SUN SPARC, however, this procedure
returns 0. The following compiler message gives us an indication of the problem:
```
warning: left shift count >= width of type
```
A. In what way does our code fail to comply with the C standard?
B. Modify the code to run properly on any machine for which data type int is at least 32 bits.
C. Modify the code to run properly on any machine for which data type int is
at least 16 bits.

A: The shift steps are more than the width of `int` in the machine. The first `1` is overflowed.
B. C.

> ./code/int_size_32.c

### 2.68
Write code for a function with the following prototype:

> ./code/lower_one_mask.c

### 2.69
Write code for a function with the following prototype:

> ./code/rotate_left.c

### 2.70
Write code for the function with the following prototype:

> ./code/fits_bits.c

### 2.71
You just started working for a company that is implementing a set of procedures to operate on a data structure where 4 signed bytes are packed into a 32-bit unsigned. Bytes within the word are numbered from 0 (least significant) to 3(most significant). You have been assigned the task of implementing a function for a machine using two’s-complement arithmetic and arithmetic right shifts with the following prototype:
That is, the function will extract the designated byte and sign extend it to be
a 32-bit int.
Your predecessor (who was fired for incompetence) wrote the following code:

A: The `xbyte` just takes the byte but doesn't extend it to a signed byte.
B. See the `new_xbyte' 

> ./code/xbyte.c

### 2.72
You are given the task of writing a function that will copy an integer val into a buffer buf, but it should do so only if enough space is available in the buffer.

This code makes use of the library function memcpy. Although its use is a bit artificial here, where we simply want to copy an int, it illustrates an approach commonly used to copy larger data structures.
You carefully test the code and discover that it always copies the value to the buffer, even when maxbytes is too small.
A. Explain why the conditional test in the code always succeeds. Hint: The sizeof operator returns a value of type size_t.

The type `size_t` is `unsigned long`, so the expression will be implicitly turned to an unsigned value.

B. Show how you can rewrite the conditional test to make it work properly.

> ./code/copy_int.c

### 2.73

Instead of overflowing the way normal two’s-complement addition does, saturating addition returns TMax when there would be positive overflow, and TMin when there would be negative overflow. Saturating arithmetic is commonly used in programs that perform digital signal processing.

> ./code/saturating_add.c

### 2.74

> ./code/tsub_ok.c

### 2.75

In fact, the difference is signed `*` ignores the highest bits.
So 
```c
unsigned unsigned_high_prod(unsigned x, unsigned y) {
  return (unsigned) signed_high_prod(x, y) + (x >> 31) * y + x * (y >> 31);
}
```

### 2.76
According to the library documentation, “The calloc function allocates memory for an array of nmemb elements of size bytes each. The memory is set to zero. If nmemb or size is zero, then calloc returns NULL.”

> ./code/calloc.c

### 2.77
Suppose we are given the task of generating code to multiply integer variable x by various different constant factors K. To be efficient, we want to use only the operations +, -, and <<. For the following values of K, write C expressions to perform the multiplication using at most three operations per expression.
A. K = 17 = (1 << 4 + 1)
B. K = −7 = (1 - (1 << 3))
C. K = 60 = (1 << 6 - 1 << 2)
D. K = −112 = (1 << 4 - 1 << 7)

### 2.78
Write code for a function with the following prototype:

> ./code/div_pow2.c

### 2.79
Write code for a function mul3div4 that, for integer argument x, computes 3 ∗ x/4 but follows the bit-level integer coding rules (page 164). Your code should replicate the fact that the computation 3*x can cause overflow.

```c
#define Foo(x) (x >> 2 + x >> 1)
```

### 2.80
Write code for a function threefourths that, for integer argument x, computes the value of 3/4 * x, rounded toward zero. It should not overflow.

```c
#define Foo(x) (x >> 1 + x >> 2)
```



