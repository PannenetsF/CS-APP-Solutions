#ifdef RUNTIME
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

void *malloc(size_t size)
{
    static __thread int print_times = 0;
    print_times++;
    void *(*mallocp)(size_t size);
    char *error;

    mallocp = dlsym(RTLD_NEXT, "malloc");
    if ((error = dlerror()) != NULL)
    {
        fputs(error, stderr);
        exit(1);
    }
    char *ptr = mallocp(size);
    if (print_times == 1)
    {
        printf("malloc(%d) = %p\n", (int)size, ptr);
    }
    print_times = 0;
    return ptr;
}
void free(void *ptr)
{
    void (*freep)(void*) = NULL;
    char *error;

    if (!ptr) return;
    freep = dlsym(RTLD_NEXT, "free");
    error = dlerror();
    if (error != NULL) {
        fputs(error, stderr);
        exit(1);
    }
    freep(ptr);
    printf("free %p", ptr);
}



#endif