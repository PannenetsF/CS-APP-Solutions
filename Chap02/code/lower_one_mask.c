#include <stdio.h>

int lower_one_mask(unsigned int n)
{
    unsigned int r = 1 << (n-1);
    r |= r >> 1;
    r |= r >> 2;
    r |= r >> 4;
    r |= r >> 8;
    r |= r >> 16;
    return r;
}

int main()
{
    printf("%x", lower_one_mask(17));
    return 0;
}