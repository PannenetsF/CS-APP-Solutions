#include <stdio.h>
#include <stdlib.h>

unsigned f2u(float x) {
    void *ptr = malloc(sizeof(unsigned));
    unsigned ret;
    *((float*)ptr) = x;
    ret = *((unsigned*)ptr);
    free(ptr);
    return ret;
}

int float_le(float x, float y) {
  unsigned ux = f2u(x);
  unsigned uy = f2u(y);
  /* Get the sign bits */
  unsigned sx = ux >> 31;
  unsigned sy = uy >> 31;
  /* Give an expression using only ux, uy, sx, and sy */

  unsigned sign_cmp = (sx && !sy);
  unsigned else_cmp = (sx && (ux >= uy)) || (!(sx) && (ux <= uy));

  return sign_cmp || else_cmp;
}

int main(){
    return 0;
}