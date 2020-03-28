#include <stdio.h>

int check_odd(unsigned x)
{
    // xor 
    x ^= x >> 16;
    x ^= x >> 8;
    x ^= x >> 4;
    x ^= x >> 2;
    x ^= x >> 1;
    return x & 1;
}

int main()
{
    printf("%d", check_odd(0x11));
}