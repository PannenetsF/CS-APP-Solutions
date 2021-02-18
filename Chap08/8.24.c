#include "csapp.h"
#include <signal.h>
#define N 2

int main()
{
    int status, i;
    pid_t pid;

    /* Parent creates N children */
    for (i = 0; i < N; i++)
        if ((pid = Fork()) == 0)
        {
            *((char *)NULL) = "hello";
            exit(100 + i);
        }

    /* Parent reaps N children in no particular order */
    while ((pid = waitpid(-1, &status, 0)) > 0)
    {
        if (WIFEXITED(status))
            printf("child %d terminated normally with exit status=%d\n",
                   pid, WEXITSTATUS(status));
        else if (WIFSIGNALED(status))
        {
            char msg[100];
            sprintf(msg, "child %d terminated by signal: %d: ", pid, WTERMSIG(status));
            psignal(WTERMSIG(status), msg);
        }
        else
            printf("child %d terminated abnormally\n", pid);
    }

    /* The only normal termination is if there are no more children */
    if (errno != ECHILD)
        unix_error("waitpid error");

    exit(0);
}