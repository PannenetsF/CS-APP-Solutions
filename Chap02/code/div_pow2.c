#include <stdio.h>

/* Divide by power of 2. Assume 0 <= k < w-1 */
int divide_power2(int x, int k) { return ((x + (1 << (k - 1))) >> k); }

int main() { return 0; }

// p164
