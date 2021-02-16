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

