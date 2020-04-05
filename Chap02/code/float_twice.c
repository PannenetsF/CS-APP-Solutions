#include <stdio.h>

typedef unsigned float_bits;

/* Compute |f|. If f is NaN, then return f. */
float_bits float_twice(float_bits f);

int main() { return 0; }

float_bits float_twice(float_bits f) {
  /* Decompose bit representation into parts */
  unsigned sign = f >> 31;
  unsigned exp = f >> 23 & 0xFF;
  unsigned frac = f & 0x7FFFFF;

  if (exp == 0) {
    // it's denormalized
    frac = frac << 1;
    exp = frac >> 23;
    frac = frac & 0x7FFFFF;
  } else if (exp != 0xff) {
    //   it's normalized
    exp = exp + 1;
  }
  // if it's inf or NaN you return the origin value

  /* Reassemble bits */
  return (sign << 31) | (exp << 23) | frac;
}