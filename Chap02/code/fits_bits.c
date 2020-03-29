#include <stdio.h>

int fits_bits(int x, int n)
{
    // if n = 4
    // positive 0x0000 0 000 0x0000 1 111
    // negetive 0x1111 1 111 0x1111 1 000
    // printf("%x\n", x);
    // printf("%x\n", x << (32 - n));
    // printf("%x\n", (x << (32 - n)) >> (32 - n));
    return !(((x << (32 - n)) >> (32 - n)) ^ x);
}

int main()
{
    printf("%d", fits_bits(-0, 4));
}