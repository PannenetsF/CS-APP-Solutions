#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main()
{
    fork();
    fork();
    fork();
    fork();

    printf("hello\n");
    exit(0);
}