#include <stdio.h>

int main()
{
    unsigned x = 0x0;

    if (!(~x)) printf("A is right!\n");
    if (!x) printf("B is right!\n");
    if (!(~(x&0xff) & 0xff)) printf("C is right!\n");
    if (
        !(x >> ((sizeof(x) - 1) << 3))
    ) printf("D is right!\n");
    return 0;
}