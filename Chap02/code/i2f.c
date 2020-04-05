#include <stdio.h>

typedef unsigned float_bits;

/* Compute (float) i */
float_bits float_i2f(int i);

int leftmost_one(unsigned x);

int main() { return 0; }

float_bits float_i2f(int i) {
  unsigned sign = i >> 31;
  unsigned val = sign ? ((unsigned)(-i)) : i;
  unsigned lfm = leftmost_one(val);
  unsigned cnt = 0;
  while (lfm != 1) {
    cnt++;
    lfm >> 1;
  }
  unsigned exp = cnt + 127;
  unsigned frac = ((val & ~(1 << cnt)) << (31 - cnt + 1)) >> 9;
  return (sign << 31) | (exp << 23) | frac;
}
int leftmost_one(unsigned x) {
  // here we want to get the first '1'
  // so we can make all digits following '1'
  x |= x >> 1;
  x |= x >> 2;
  x |= x >> 4;
  x |= x >> 8;
  x |= x >> 16;
  return ~(x >> 1) & x;
}