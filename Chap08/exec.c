#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
int main(int argc_m, char *argv_m[], char *envp[])
{
    int f = execve(argv_m[0], argv_m+1, envp);
    printf("%s\n", argv_m[0]);
    printf("%s\n", *(argv_m+1));
    printf("%d", f);
    return 0;

}