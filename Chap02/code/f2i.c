#include <stdio.h>

typedef unsigned float_bits;

/*
 * Compute (int) f.
 * If conversion causes overflow or f is NaN, return 0x80000000
 */
int float_f2i(float_bits f);

int main() { return 0; }

int float_f2i(float_bits f) {
  unsigned sign = f >> 31;
  unsigned exp = f >> 23 & 0xff;
  unsigned frac = f & 0x7fffff;

  unsigned ans;

  if (exp == 0xff) {
    // NaN of Inf
    ans = 1 << 31;
  } else if (exp - 127 >= 31) {
    // overflow
    ans = 1 << 31;
  } else if (exp - 127 < 0) {
    ans = 0x0;
  } else {
    int ans_un = (1 << 24 | frac) << (exp - 127);
    if (sign == 0)
      ans = ans_un;
    else if (sign == 1)
      ans = ~ans_un + 1;
  }
  return ans;
}