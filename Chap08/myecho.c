#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[], char *envp[])
{
    printf("CMD args:\n");
    for (int i = 0; argv[i] != NULL; ++i) {
        printf("\targv[%02d]: %s\n", i, argv[i]);
    }

    printf("env vars:\n");
    for (int i = 0; envp[i] != NULL; ++i) {
        printf("\tenvp[%02d]: %s\n", i, envp[i]);
    }

    return 0;
}