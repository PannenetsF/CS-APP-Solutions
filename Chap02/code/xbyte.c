#include <stdio.h>

/* Declaration of data type where 4 bytes are packed
into an unsigned */
typedef unsigned packed_t;
/* Extract byte from word. Return as signed integer */
int xbyte(packed_t word, int bytenum);
int new_xbyte(packed_t word, int bytenum);

int main() {
  printf("0x%x\n", new_xbyte(0xffu, 0));

  return 0;
}

int xbyte(packed_t word, int bytenum) {
  return (word >> (bytenum << 3)) & 0xFF;
}
int new_xbyte(packed_t word, int bytenum) {
  int temp = (word >> (bytenum << 3)) & 0xFF;
  temp = temp << (32 - (bytenum << 3) - 8);
  temp = temp >> (32 - (bytenum << 3) - 8);
  return temp;
}