#include <stdio.h>

/*
* Generate mask indicating leftmost 1 in x. Assume w=32.
* For example, 0xFF00 -> 0x8000, and 0x6600 --> 0x4000.
* If x = 0, then return 0.
*/
int leftmost_one(unsigned x)
{
    // here we want to get the first '1'
    // so we can make all digits following '1'
    x |= x >> 1;
    x |= x >> 2;
    x |= x >> 4;
    x |= x >> 8;
    x |= x >> 16;
    return ~(x >> 1) & x;
}

int main()
{
    printf("0x%x\n", leftmost_one(0xff00u));
    return 0;
}