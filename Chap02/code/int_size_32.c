#include <stdio.h>
#include <any_odd_one.c>

#define BITS_LEAST 32
// #define BITS_LEAST 16

int int_size_32() {
    int msb = 1 << (BITS_LEAST - 1);
    int beyond_msb = msb << 1;

    return msb && !beyond_msb;
}

int main()
{
    // int a = 1 << 128;
    // you should look at thr error output after uncomment line 12
    if (int_size_32()) printf("the size of int is %d\n", BITS_LEAST);
    else printf("more than %d\n", BITS_LEAST);
    return 0;
}