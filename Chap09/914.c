#include "csapp.h"

int main()
{
    int fd;
    fd = open("hello.txt", O_RDWR, 0);
    void *mp = mmap(NULL, strlen("hello, world!\n"), PROT_WRITE, MAP_SHARED, fd, 0);
    *((char *)mp) = 'j';
    close(fd);
    return 0;
}