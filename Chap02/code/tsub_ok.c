#include <stdio.h>


// from 2.73 and changed a little
int saturating_add(int x, int y)
{
    unsigned x_sign = x & 0x80000000;
    unsigned y_sign = y & 0x80000000;
    unsigned sum_sign = (x + y) & 0x80000000;
    unsigned pos_over = (~x_sign) && (!y_sign) && (sum_sign);
    unsigned neg_over = (x_sign) && (y_sign) && (!sum_sign);
    unsigned sum = (unsigned) x + (unsigned) y;
    pos_over && (sum = __INT32_MAX__);
    neg_over && (sum = ~(__INT32_MAX__));
    return (int) (pos_over || neg_over);
}

int tsub_ok(int x, int y){
    return (saturating_add(x, -y));
}
