## 7.6



```c
buf -> externals -> .symtab -> m -> .data
bufp0 -> globals -> .symtab -> swap -> .data
bufp1 -> locals -> .symtab -> swap -> .bss
incr -> locals -> .symtab -> swap -> .text
count -> locals -> .symtab -> swap -> ..bss
swap -> globas -> .symtab -> swap -> .text
temp -> locals -> no -> no -> no // temp is managed by the runtime stack
```

## 7.7

```c
// bar5.c
static int x;

void f()
{
	x = 0.0;
}
```

## 7.8

A. main,1 / main.2
B. unknown / unknown  for neither x is initialised.
C. error / error  for both x is initialised

## 7.9

Because the `main` in `foo6.c` is strong, while the one in `bar6.c` is weak.

## 7.10

```sh 
gcc p.o libx.a p.o

gcc p.o libx.a liby.a libx.a

gcc p.o libx.a liby.a libx.a libz.a
```

## 7.11

Allocation for `.bss`

## 7.12

As stated in Fig. 7.10:

```c
refaddr = ADDR(s) + r.offset
*refptr = (unsigned) (ADDR(r.symbol) + r.addend - refaddr)
```

A. 
refaddr = 0x4004ea 
*refptr = 0xa

B. 
refaddr = 0x4004da
*refptr = (unsigned)(0x400500 - 4 - 0x4004da) = 34 = 0x22
