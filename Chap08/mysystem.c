#include <stdio.h>
#include "csapp.h"

char **envp_my;

int mysystem(char *command)
{
    int status, i;
    pid_t pid;
    pid = Fork();

    if (pid == 0)
    {
        char *argv[] = {
            "",
            "-c",
            command,
            NULL};
        execve("/bin/sh", argv, envp_my);
    }
    else
    {
        printf("pid: %d , kill me via kill cmd\n", pid);
    }
    if (Waitpid(pid, &status, 0) > 0)
    {
        if (WIFEXITED(status))
        {
            return WEXITSTATUS(status);
        }
        if (WIFSIGNALED(status))
        {
            return WTERMSIG(status);
        }
    }

    return 0;
}

int main(int argc, char *argv[], char *envp[])
{
    envp_my = envp;
    printf("normal: %d\n", mysystem("ls"));
    fflush(stdout);
    printf("killed by keyboard: %d\n", mysystem("./wait"));
    fflush(stdout);
    sleep(1);
    return 0;
}