#! /bin/sh

gcc -DRUNTIME -shared -fPIC -o mymalloc.so mymalloc.c -ldl
gcc -o intr int.c
LD_PRELOAD="./mymalloc.so" ./intr 