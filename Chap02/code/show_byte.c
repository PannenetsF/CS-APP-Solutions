#include <stdio.h>
#include <inttypes.h>

int main()
{
    unsigned int * num_ptr;
    *(num_ptr) = 0x10203040;
    unsigned char * num_ptr_char = (unsigned char *)(num_ptr);

    if (*(num_ptr_char) == *(num_ptr_char) & 0xff) {
        printf("Big Endian\n");
    } else {
        printf("Small Endian\n");
    }

    return 0;
}