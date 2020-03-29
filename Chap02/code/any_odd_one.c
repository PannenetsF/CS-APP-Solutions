#include <stdio.h>

int any_odd_one(unsigned int n)
{
    n |= n >> 16;
    n |= n >> 8;
    n |= n >> 4;
    n |= n >> 2;
    return n & 0x1u;
}

int main()
{
    printf("%d\n", any_odd_one(0x40000));
    return 0;
}