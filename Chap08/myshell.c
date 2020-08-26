#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define MAXCHARS    256
#define MAXARGS     256

void eval(char *cmdline, char **envp);
int parseline(char *buf, char **argv);
int build_in_cmd(char **argv);


int main(int argc_m, char *argv_m[], char *envp[])
{
    char cmdline[MAXCHARS]; 

    while (1)
    {
        printf("$mysh> ");
        fgets(cmdline, MAXCHARS, stdin);
        if (feof(stdin)) 
        {
            printf("stdin error\n");
            exit(0);
        }
        eval(cmdline, envp);
    }
}


void eval(char *cmdline, char **envp)
{
    char *argv[MAXARGS];
    char buf[MAXCHARS];
    int bg;
    pid_t pid;

    strcpy(buf, cmdline);
    bg = parseline(buf, argv);

    if (argv[0] == NULL) 
        return;
    
    if (build_in_cmd(argv) == 0) {
        if ((pid = fork()) == 0) {
            // printf("%d\n", execve(argv[0], argv, envp));
            if (execve(argv[0], argv, envp) < 0) {
                printf("$%s: command not found\n", argv[0]);
                exit(0);
            }  
        }

        if (bg == 0) {
            int status;
            if (waitpid(pid, &status, 0) < 0) 
                fprintf(stderr, "waitfg: waitpid error\n");
        }
        else
            printf("%d %s\n", pid, cmdline);
    }

    return;
}


int parseline(char *buf, char **argv)
{
    char *ptr;
    int argc;
    int bg;

    buf[strlen(buf)-1] = ' ';
    while (*buf && (*buf == ' '))
        buf++; // ignore the leading spaces
    
    argc = 0;
    while ((ptr = strchr(buf, ' ')))
    {
        argv[argc] = buf;
        *ptr = '\0';
        ++argc;
        buf = ptr + 1;
        while (*buf && (*buf == ' '))
            buf++; // ignore the leading spaces
    }
    argv[argc] = NULL;

    if (argc == 0) 
        return 1;
    
    bg = *argv[argc-1] == '&';
    if (bg) 
        argv[argc-1] = NULL;
    
    return bg;
}

int build_in_cmd(char **argv)
{
    if (strcmp(argv[0], "quit") == 0)
        exit(0);
    if (strcmp(argv[0], "&") == 0) 
        return 1;
    return 0;
}