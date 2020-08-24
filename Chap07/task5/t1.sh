#! /bin/sh

gcc -DCOMPILETIME -c mymalloc.c
gcc -I. -o intc int.c mymalloc.o