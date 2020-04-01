#include <stdio.h>
#include <string.h>

void copy_int(int val, void *buf, int maxbytes) {
  if ((long)(maxbytes - sizeof(val)) >= 0)
    memcpy(buf, (void *)&val, sizeof(val));
  else
    printf("maxbytes too small!\n");
}

int main() {
  int des = 0;
  copy_int(12, (void *)(&des), 0);
  return 0;
}