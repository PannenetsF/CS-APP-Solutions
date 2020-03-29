#include <stdio.h>

unsigned rotate_left(unsigned x, int n)
{
    unsigned mask = (__UINT32_MAX__) >> (n);
    return ((x & mask) << (n)) | ((x & (~mask)) >> (32u - (n)));
}

int main()
{
    printf("0x%x\n", rotate_left(0x12345678, 4*0));
    return 0;
}