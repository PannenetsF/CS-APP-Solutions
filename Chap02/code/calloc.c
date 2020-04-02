#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void *calloc(size_t nmemb, size_t size) {
  void *ptr;
  if (nmemb * size) {
    ptr = malloc(nmemb * size);
    memset(ptr, 0, nmemb * size);
  } else
    ptr = NULL;
  return ptr;
}

int main() {
  printf("%p\n", calloc(1, 3));
  printf("%p\n", calloc(0, 3));
  printf("%p\n", calloc(1, 0));
  return 0;
}