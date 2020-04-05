#include <stdio.h>

float fpwr2(int x) {
  /* Result exponent and fraction */
  unsigned exp, frac;
  unsigned u;
  // bias = 127 = 1 << 7 - 1
  if (x < 0 - ((1 << 7) - 1) - (23)) {
    /* Too small. Return 0.0 */
    //
    exp = 0;
    frac = 0;
  } else if (x < 0 - ((1 << 7) - 1)) {
    // mininum normalized result
    /* Denormalized result */
    exp = 0;
    frac = (1 << 23) >> (x - ((1 << 7) - 1));
  } else if (x < 0xff << 23) {
    /* Normalized result. */
    exp = x + (1 << 7 - 1);
    frac = ;
  } else {
    /* Too big. Return +oo */
    exp = 0xff;
    frac = 0;
  }
  /* Pack exp and frac into 32 bits */
  u = exp << 23 | frac;
  /* Return as float */
  return u2f(u);
}

int main() {}