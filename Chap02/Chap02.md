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
    - [2.81](#281)
    - [2.82](#282)
  - [Homework Part3](#homework-part3)
    - [2.83](#283)
    - [2.84](#284)
    - [2.85](#285)
    - [2.86](#286)
    - [2.87](#287)
    - [2.88](#288)
    - [2.89](#289)
    - [2.90](#290)
    - [2.91](#291)
    - [2.92](#292)
    - [2.93](#293)
    - [2.94](#294)
    - [2.95](#295)
    - [2.96](#296)
    - [2.97](#297)

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

### 2.81
Write C expressions to generate the bit patterns that follow, where a k represents k repetitions of symbol a. Assume a w-bit data type. Your code may contain references to parameters j and k, representing the values of j and k, but not a
parameter representing w.
A. 1 w−k 0 k : (~(0x0u) << k)
B. 0 w−k−j 1 k 0 j : (~A) << j

### 2.82
We are running programs where values of type int are 32 bits. They are represented in two’s complement, and they are right shifted arithmetically. Values of type unsigned are also 32 bits.
We generate arbitrary values x and y, and convert them to unsigned values as follows:
```c
/* Create some arbitrary values */
int x = random();
int y = random();
/* Convert to unsigned */
unsigned ux = (unsigned) x;
unsigned uy = (unsigned) y;
```
```
A. (x<y) == (-x>-y) (x <- INT_MIN) (y <- 0)
B. ((x+y)<<4) + y-x == 17*y+15*x
C. ~x+~y+1 == ~(x+y)
D. (ux-uy) == -(unsigned)(y-x)
E. ((x >> 2) << 2) <= x
```

> ./code/signed_unsigned_test.c

---
## Homework Part3


### 2.83

Consider numbers having a binary representation consisting of an infinite string of the form 0.y y y y y y . . . , where y is a k-bit sequence. For example, the binary representation of 3 1 is 0.01010101 . . . (y = 01), while the representation of 5 1 is 0.001100110011 . . . (y = 0011).

> Let's see the number, with the `y` pattern: `0.yyy...`
> Then we do a right shift with a step of length of `y`, so we get a `y.yyy...`
> `y.yyy... - 0.yyy... = y`
> `(1 << Length(y) - 1)(0.yyy..) = y`

> a) $\frac{5}{7}$
> b) $\frac{6}{15} = \frac{2}{5}$
> c) $\frac{19}{64}$

### 2.84

Fill in the return value for the following procedure, which tests whether its first argument is less than or equal to its second. Assume the function f2u returns an unsigned 32-bit number having the same bit representation as its floating-point argument. You can assume that neither argument is NaN. The two flavors of zero, +0 and −0, are considered equal.

> ./code/flat_le.c

### 2.85

Given a floating-point format with a k-bit exponent and an n-bit fraction, write formulas for the exponent E, the significand M, the fraction f , and the value V for the quantities that follow. In addition, describe the bit representation.

A. The number 7.0
> sign    exp        frac
> 0       10...011   1100..0

B. The largest odd integer that can be represented exactly
> (assume: n >= k)
> 111...11 (totally k 1s)

C. The reciprocal of the smallest positive normalized value
> sign    exp        frac
> 0       00...001   00..01
> $(1+1/2^k)*(2-2^{k-1})$

### 2.86
Intel-compatible processors also support an “extended-precision” floating-point format with an 80-bit word divided into a sign bit, k = 15 exponent bits, a single integer bit, and n = 63 fraction bits. The integer bit is an explicit copy of the implied bit in the IEEE floating-point representation. That is, it equals 1 for normalized values and 0 for denormalized values. Fill in the following table giving the approximate values of some “interesting” numbers in this format:


> The bits are arranged as this:
> sign(1)    exp(15)     int(1)   frac(63)
> So you can just simply treat the `int` and `frac` as a fixed point number like: `x.xxxx..xxx`
> sign(1)    exp(15)     fixed(64)


Smallest positive denormalize
> 0  00...000 00..000
> That's `positive zero`


Smallest positive normalized
> 0 00...001 10..000


Largest normalized
> 0 11..111 11..111

### 2.87
The 2008 version of the IEEE floating-point standard, named IEEE 754-2008, includes a 16-bit “half-precision” floating-point format. It was originally devised by computer graphics companies for storing data in which a higher dynamic range is required than can be achieved with 16-bit integers. This format has 1 sign bit, 5 exponent bits (k = 5), and 10 fraction bits (n = 10). The exponent bias is 2 5−1 − 1 = 15.


| Description           | Hex    | M          | E     | V               | D                     |
| --------------------- | ------ | ---------- | ----- | --------------- | --------------------- |
| -0                    | 0x8000 | 0          | 0     | 0               | -0.0                  |
| Smallest value > 2    | 0x4401 | (1+1/1024) | 2     | 1025/512        | 2.00195               |
| 512                   | 0x6000 | 1          | 2^9   | 1*2^9           | 512                   |
| Largest denormalized  | 0x03ff | 1023/1024  | 2^-14 | 1023/1024*2^-14 | 6.097555160522461e-05 |
| -$\infty$             | 0x7c00 | -          | -     | -               | -$\infty$             |
| Represented by 0x3bb0 | 0x3bb0 | 1+59/64    | 2^-1  | 59/128          | 0.9609375             |



### 2.88

Consider the following two 9-bit floating-point representations based on the IEEE
floating-point format.
1. Format A
There is 1 sign bit.
There are k = 5 exponent bits. The exponent bias is 15.
There are n = 3 fraction bits.
2. Format B
There is 1 sign bit.
There are k = 4 exponent bits. The exponent bias is 7.
There are n = 4 fraction bits.

<!-- Making a table is so diturbing... So I turn to online generator. -->

| Format A    |                     | Format B    |                |
| ----------- | ------------------- | ----------- | -------------- |
| Bits        | Value               | Bits        | Value          |
| 1 01111 001 | $\frac{-9}{8}$      | 1 0111 0010 | $\frac{-9}{8}$ |
| 0 10110 011 | 176                 | 0 1110 0110 | 176            |
| 1 00111 010 | $\frac{-5}{2^{10}}$ | 1 0000 000  | -0             |
| 0 00000 111 | $\frac{15}{2^{18}}$ | 0 0000 000  | 0              |
| 1 11100 000 | $-2^{13}$           | 1 1111 0000 | $-\infty$      |
| 0 10111 100 | $3*2^7$             | 0 1111 100  | $3*2^7$        |


### 2.89

We are running programs on a machine where values of type int have a 32-bit two’s-complement representation. Values of type float use the 32-bit IEEE format, and values of type double use the 64-bit IEEE format. We generate arbitrary integer values x, y, and z, and convert them to values of type double as follows:

```c
/* Create some arbitrary values */
int x = random();
int y = random();
int z = random();
/* Convert to double */
double dx = (double) x;
double dy = (double) y;
double dz = (double) z;
```

A. (float) x == (float) dx 
> True
> Number range: Double > float > int
B. dx - dy == (double) (x-y)
> False
> (x-y) could overflow INT_32_MAX, while (dx-dy) won't.
C. (dx + dy) + dz == dx + (dy + dz)
> True
D. (dx * dy) * dz == dx * (dy * dz)
> False.
> If dx and dy are both to small thus (dx * dy) generates a 0, it will fail.
E. dx / dx == dz / dz
> False.
> Divided by 0.


### 2.90

You have been assigned the task of writing a C function to compute a floating-point representation of 2 x . You decide that the best way to do this is to directly construct the IEEE single-precision representation of the result. When x is too small, your routine will return 0.0. When x is too large, it will return +∞. Fill in the blank portions of the code that follows to compute the correct result. Assume the function u2f returns a floating-point value having an identical bit representation as its unsigned argument.

> ./code/fpwr2.c


### 2.91

Around 250 B.C., the Greek mathematician Archimedes proved that 223/71 < π < 7 . Had he had access to a computer and the standard library <math.h>, he would have been able to determine that the single-precision floating-point approximation of π has the hexadecimal representation 0x40490FDB. Of course, all of these are just approximations, since π is not rational.

A. What is the fractional binary number denoted by this floating-point value?

> Rewrite 0x40490fdb in binary format:
> 0100 0000 0100 1001 0000 1111 1101 1011
> 0   1000 0000   1001001000011111011011
> sign is `+` exp is `1` frac is `2394075/4194304 + 1`
> 3.1415839195251465
> b11.0010010000111110111011

B. What is the fractional binary representation of
22/7 
Hint: See Problem 2.83.

> 22/7: b11.001 00**1** 001 ...

C. At what bit position (relative to the binary point) do these two approximations to π diverge?
> difference start from the bold `1`

### 2.92
Following the bit-level floating-point coding rules, implement the function with
the following prototype:
```c
/* Compute -f. If f is NaN, then return f. */
float_bits float_negate(float_bits f);
```

> ./code/float_negate.c

### 2.93

Following the bit-level floating-point coding rules, implement the function with the following prototype:
```c
/* Compute |f|. If f is NaN, then return f. */
float_bits float_absval(float_bits f);
```


> ./code/float_absval.c

### 2.94

Following the bit-level floating-point coding rules, implement the function with the following prototype:
```c
/* Compute 2*f. If f is NaN, then return f. */
float_bits float_twice(float_bits f);
```

> ./code/float_twice.c

### 2.95

Following the bit-level floating-point coding rules, implement the function with the following prototype:
```c
/* Compute 0.5*f. If f is NaN, then return f. */
float_bits float_half(float_bits f);
```

> ./code/float_half.c

### 2.96

Following the bit-level floating-point coding rules, implement the function with the following prototype:
```c
/*
* Compute (int) f.
* If conversion causes overflow or f is NaN, return 0x80000000
*/
int float_f2i(float_bits f);
```

> ./code/f2i.c

### 2.97

Following the bit-level floating-point coding rules, implement the function with
the following prototype:
```c
/* Compute (float) i */
float_bits float_i2f(int i);
```

> ./code/i2f.c
