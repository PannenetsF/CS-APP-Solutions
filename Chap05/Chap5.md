# The Memory Hierarchy

## 6.22

Assume that a bit takes l of perimeter, a track takes y * r.

Sum of bits = ((x * r) / l) * (1 - x) / y = K * x * (1 - x)

When x = 0.5, the sum gets the optimal.

## 6.23

$$
\begin{aligned}
    T_{\text{access}} &= T_{\text{avg seek}} + T_{\text{avg rot}} + T_{\text{avg trans}} \\
    &= 4 \text{ms} + \frac{1}{2} \cdot \frac{60}{15000} \cdot 1000 \text{ms} +  \frac{60}{15000} \cdot \frac{1}{800} \cdot 1000 \text{ms} \\ 
    &= 6.005 \text{ms}
\end{aligned}
$$

## 6.24

2 MB = 2 000 000 Byte 

\#Sec = 2 MB / 512 = 3906.25

\#Track = 2

The Best

$$
T_{\text{access}} &= T_{\text{avg seek}} + T_{\text{avg rot}} + 2 * T_{\text{max rot}} \\
& = 22 \text{ms}
$$

The worst 


$$
T_{\text{access}} &= (T_{\text{avg seek}} + T_{\text{avg rot}}) \times 3907 \\
& = 23442 \text{ms}
$$

## 6.25 & 6.26

$C = B \cdot E \cdot S$

$s = \lceil \log_2 S \rceil$

$b = \lceil \log_2 B \rceil$

$t = m - s - b$

## 6.27

```py
def real_bin(num, width):
    s = bin(num)
    s = s[2:]
    return (width-len(s))*'0' + s 

def addr(t, s):
    st = real_bin(t, 8)
    st += real_bin(s, 3) 
    return (hex(int(st+'00', 2)), hex(int(st+'11', 2)))

print(addr(0x45,1))
print(addr(0x38,1))
print(addr(0x91,6))


```

```sh
('0x8a4', '0x8a7') # A
('0x704', '0x707') # A
('0x1238', '0x123b') # B
```

## 6.28

```py
print(addr(0xc7,4))
print(addr(0x05,4))

print(addr(0x71,5))

print(addr(0xde,7))
```

```sh
('0x18f0', '0x18f3') # B
('0xb0', '0xb3') # B
('0xe34', '0xe37') # C
('0x1bdc', '0x1bdf') # D
```

## 6.29

CO 1:0
CI 3:2
CT 12:4

```py
bin(0x834) 
'0b100000110100' # 0x83 1 0 not valid
bin(0x836) 
'0b100000110110' # 0x83 0 3 0xd0
bin(0xffd) # 0xff 3 1 0x9a
```

## 6.30

C = B * E * S = 4 * 4 * 8 = 128

CO 1:0
CI 4:2
CT 12:4

## 6.31


'0011100011010'

CO 0x2
CI 0x6
CT 0x38
Hit
0xeb


## 6.32

'1011011101000'

CO 0x0
CI 0x2
CT 0xb7
Miss
--

## 6.33

0b1011110001000 - 0b1011110001011

0b1011011001000 - 0b1011011001011


## 6.34

dst

m m m m

m m m m

m m m m

m m m m

src

m h h h

m h h h

m h h h

m h h h

## 6.35

dst

m h h h

m h h h

m h h h

m h h h



src

m h h h

m h h h

m h h h

m h h h


## 6.36

A 

128 * 4 = 512

miss rate = 100%

B 

miss rate = 25%

C

miss rate = 25% 

D

NO, for each block's size is fixed.

E

Yes, each miss will bufer more data for further usage.


## 6.37

This cache has 4 * 1024 / 16 = 256 blocks.

sumA 0.25 0.25

sumB 0.25 0.25

sumC 0.25 0.25

## 6.38

the struct is of 16 byte

sumWrite = 16 * 16 * 4 = 1024

missWrite = 128

missRate = 0.125


