#include <stdio.h>

unsigned replace_byte (unsigned x, int i, unsigned char b)
{
    unsigned mask = 0xff << (i * 8);
    return x & (~mask) | (b << (i * 8));
}

int main()
{
    printf("0x%x\n", replace_byte(0x12345678u, 2, 0xAB));
    printf("0x%x\n", replace_byte(0x12345678u, 1, 0xAB));
    printf("0x%x\n", replace_byte(0x12345678u, 0, 0xAB));

    return 0;
}