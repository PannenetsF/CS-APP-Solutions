#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main()
{
    pid_t pid;
    int x = 1;

    pid = fork();
    if (pid == 0) {
        printf("child: %x\n", ++x);
        exit(0);     
    }

    printf("parent: %x\n", --x);
    return 0;
}