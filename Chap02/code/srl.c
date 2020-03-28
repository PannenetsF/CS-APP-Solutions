#include <stdio.h>

unsigned srl(unsigned x, int k) 
{
    /* Perform shift arithmetically */
    unsigned xsra = (int) x >> k;
    unsigned bits = sizeof(x) << 3; 
    unsigned mask = ((unsigned)(-1)) << (bits - k);
    return xsra & (~mask);
}

int sra(int x, int k) 
{
    /* Perform shift logically */
    int xsrl = (unsigned) x >> k;
    unsigned bits = sizeof(x) << 3;
    int sign = !(x & (1 << (bits - 1))); // 0 -> signed 1 -> unsigned
    int mask = (-1) << (bits - 1);
    mask &= (sign - 1);
    return xsrl | mask;
}

int main()
{
    printf("%x", srl((unsigned)(-1), 1));
    return 0;
}