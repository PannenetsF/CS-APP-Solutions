#include <stdio.h>

int main()
{
    unsigned long * num_ptr;
    *(num_ptr) = 0x1020;
    unsigned char * num_ptr_char = (unsigned char *)(num_ptr);

    if (*(num_ptr_char) == *(num_ptr_char) & 0xff) {
        return 1;
    } else {
        return 0;
    }
    

    return 0;
}