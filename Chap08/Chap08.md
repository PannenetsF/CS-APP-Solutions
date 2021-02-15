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