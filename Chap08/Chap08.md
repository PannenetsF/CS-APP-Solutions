# Note 

1. ECF is the way that program communicates with operate system.
2. Exception is related to both hardware and software.
3. Exception handler runs in kernel mode, having full access to system resources.
4. Exceptions can be divided into interrupt, trap, fault, abort.
5. Interruput is from hardware and asynchronous.
6. Trap is systemcall.
7. Processors use some special control registers to show the program is running in privileged mode or not.
8. Kernel maintains a context for each process. It's all kernel needed to restart a preempted process. 
9. For a parent and child process, we cannot determine the interleaving.

# HW

## 8.9

AB F
AC T
AD T 
BC T
BD T 
CD T 

## 8.10 

A: `fork`
B: `execve`, `longjump`
C: `setjump`

## 8.11 

main----Fork1---------Fork2--------print----
        |               |----------print---- 
        |-----Fork1-2--------------print----
                |------------------print----

4 in total.

## 8.12

main----doit----fork1------fork2-----print------print----
                |           |--------print------print----
                |----------fork2-----print------print----
                            |--------print------print----

8 in total.

## 8.13

parent 2 child 4 3 
child 4 3 parent 2 

## 8.14 

main-------p-----Fork-----print-----exit_in_doit
        |           |-----print-----exit_in_doit
        |--c-----return---print-----exit

3 in total.

## 8.15 

main-------p-----Fork-----print-----return----print----exit
        |           |-----print-----return----print----exit
        |--c-----return---print-----exit

5 in total.

                
## 8.16

2 
The child waits until the parent process is done, and do ++counter(1) == 2.


## 8.17

main----print----Fork----print----print_exit----print
                   |-----print----print 

Hello // fixed 
1
Bye
0
2 // fixed 
Bye // fixed 


Hello // fixed 
0
1
Bye
2 // fixed 
Bye // fixed 


Hello // fixed 
1
0
Bye
2 // fixed 
Bye // fixed 

## 8.18

main--------Fork--------Fork--------print_1--------exit:p
             |           |----------print_0--------exit:c2
             |---atexit-Fork--------print_1--------exit:c1   
                         |----------print_0--------exit:c1c

A: p(print_1) c1(print_1) c1(exit_) c2(print_0) c1c(print_0) c1c(exit_) 
B: impossible 
C: p(print_1) c1c(print_0) c1c(exit_) c1(print_1) c1(exit_) c2(print_0) 
D: impossible 
E: p(print_1) c2(print_0) c1c(print_0) c1c(exit_) c1(print_1) c1(exit_) 

## 8.19 

fork-n = fork , fork-n-1 

2^n 

## 8.20 

`myls.c`

## 8.21 

bacc
bcac
acbc
abcc

## 8.23 

The sleep gets all `SIGUSR2`. 
