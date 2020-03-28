#include <stdio.h>

#define X_VAL 0x89ABCDEF
#define Y_VAL 0x76543210

int main()
{
    unsigned int x = X_VAL;
    unsigned int y = Y_VAL;

    unsigned int ans = 
        (x & 0xff) + 
        (y & ~((unsigned int)(0xff)));
    
    printf("0x%x\n", ans);

    return 0;

}