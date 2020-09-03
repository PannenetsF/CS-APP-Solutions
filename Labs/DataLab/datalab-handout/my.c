#include <stdio.h>

// 11111111000 4
// 00000000110 3

unsigned floatPower2(int x) {
  int lowest = -127 - 23;
  int highest = 128;
  if (x < lowest) return 0;
  if (x > highest) return 0xff<<23;
  if (x < (-127)) return 1 << (x - lowest);
  if (x >= -127) return (x + 127) << 23;
}


int main() {
    float a = 0.25;
    // unsigned b = 1111111;
    printf("%x \n%x", *((unsigned *)(&a)), floatPower2(123));
    // printf("%x", *((unsigned *)(&b)));
    return 0;
}
