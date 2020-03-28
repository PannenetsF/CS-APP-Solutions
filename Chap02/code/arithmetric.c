#include <stdio.h>

int main()
{
    unsigned int x = (__INT32_MAX__);
    // int x = (__INT32_MAX__);
    if (x ^ ((x << 1) >> 1)) printf("arithmetric\n");
    else printf("logical\n");

    return 0;
}