#include <stdio.h>

typedef unsigned float_bits;

/* Compute |f|. If f is NaN, then return f. */
float_bits float_absval(float_bits f);

int main() { return 0; }

float_bits float_absval(float_bits f) {
  /* Decompose bit representation into parts */
  unsigned sign = f >> 31;
  unsigned exp = f >> 23 & 0xFF;
  unsigned frac = f & 0x7FFFFF;
  if (frac && (exp == 0xffu))
    ; // it's NaN
  else
    sign = 0;

  /* Reassemble bits */
  return (sign << 31) | (exp << 23) | frac;
}