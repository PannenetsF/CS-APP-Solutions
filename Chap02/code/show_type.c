#include <stdio.h>
#include <inttypes.h>

void show_type(size_t size, void *src) {
    printf(" the size is %d  ", size);
    unsigned char *ptr = (unsigned char *)src;
    for (int i = 0; i < size; i ++) {
        printf("%04hx_", *(ptr + i));
    }
    printf("\n");
}

int main()
{
    short num_s = 412;
    long num_l = 43561;
    long long num_ll = 638721;
    double num_d = 321456.312;

    printf("num is %d type is short", num_s);
    show_type(sizeof(num_s), &num_s);
    
    printf("num is %d type is long", num_l);
    show_type(sizeof(num_l), &num_l);

    printf("num is %l type is long long", num_ll);
    show_type(sizeof(num_ll), &num_ll);

    printf("num is %f type is double", num_d);
    show_type(sizeof(num_d), &num_d);

    return 0;

}