#include "csapp.h"

int main(int argc, char *argv[], char *envp[])
{

    if (execve("/usr/bin/ls", argv, envp) == -1)
    {
        fprintf(stderr, "error: %s\n", strerror(errno));
        exit(1);
    }
}