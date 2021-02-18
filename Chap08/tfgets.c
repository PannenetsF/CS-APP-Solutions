#include <stdio.h>
#include "csapp.h"

sigjmp_buf buf;

void handler(int sig)
{
    siglongjmp(buf, 1);
}

char *tfgets(char *str, int size, FILE *stream)
{
    if (!sigsetjmp(buf, 1))
    {
        alarm(5);
        Signal(SIGALRM, handler);
        return fgets(str, size, stream);
    }
    else
    {
        return NULL;
    }
}

int main()
{
    char inbuf[100];
    char *input = tfgets(inbuf, 100, stdin);
    if (input)
        printf("we get: \n\t%s", inbuf);
    else
        printf("we get nothing\n");
    return 0;
}