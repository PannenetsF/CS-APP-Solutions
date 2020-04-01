#include <stdio.h>



int saturating_add(int x, int y)
{
    unsigned x_sign = x & 0x80000000;
    unsigned y_sign = y & 0x80000000;
    unsigned sum_sign = (x + y) & 0x80000000;
    unsigned pos_over = (!x_sign) && (!y_sign) && (sum_sign);
    unsigned neg_over = (x_sign) && (y_sign) && (!sum_sign);
    unsigned sum = (unsigned) x + (unsigned) y;
    pos_over && (sum = __INT32_MAX__);
    neg_over && (sum = ~(__INT32_MAX__));
    return (int) sum;
}

int main() {
    printf("%x\n", saturating_add(1,2));
    printf("%x\n", saturating_add(__INT32_MAX__,2));
    printf("%x\n", saturating_add(__INT32_MAX__+1,-2));
    return 0;
}