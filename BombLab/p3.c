if (1 > $eax)
{
    if (0x7u > *($rsp + 0x8)) {
        explode();
    } 
    else {
        $eax = *($rsp + 0x8)
    }
}
else 
    explode();

0x0000000000400f43 <+0>:     sub    $0x18,%rsp
0x0000000000400f47 <+4>:     lea    0xc(%rsp),%rcx
0x0000000000400f4c <+9>:     lea    0x8(%rsp),%rdx
0x0000000000400f51 <+14>:    mov    $0x4025cf,%esi
0x0000000000400f56 <+19>:    mov    $0x0,%eax
0x0000000000400f5b <+24>:    callq  0x400bf0 <__isoc99_sscanf@plt>
0x0000000000400f60 <+29>:    cmp    $0x1,%eax
0x0000000000400f63 <+32>:    jg     0x400f6a <phase_3+39>
0x0000000000400f65 <+34>:    callq  0x40143a <explode_bomb>
0x0000000000400f6a <+39>:    cmpl   $0x7,0x8(%rsp)
0x0000000000400f6f <+44>:    ja     0x400fad <phase_3+106>
0x0000000000400f71 <+46>:    mov    0x8(%rsp),%eax
0x0000000000400f75 <+50>:    jmpq   *0x402470(,%rax,8)
0x0000000000400f7c <+57>:    mov    $0xcf,%eax
0x0000000000400f81 <+62>:    jmp    0x400fbe <phase_3+123>
0x0000000000400f83 <+64>:    mov    $0x2c3,%eax
0x0000000000400f88 <+69>:    jmp    0x400fbe <phase_3+123>
0x0000000000400f8a <+71>:    mov    $0x100,%eax
0x0000000000400f8f <+76>:    jmp    0x400fbe <phase_3+123>
0x0000000000400f91 <+78>:    mov    $0x185,%eax
0x0000000000400f96 <+83>:    jmp    0x400fbe <phase_3+123>
0x0000000000400f98 <+85>:    mov    $0xce,%eax
0x0000000000400f9d <+90>:    jmp    0x400fbe <phase_3+123>
0x0000000000400f9f <+92>:    mov    $0x2aa,%eax
0x0000000000400fa4 <+97>:    jmp    0x400fbe <phase_3+123>
0x0000000000400fa6 <+99>:    mov    $0x147,%eax
0x0000000000400fab <+104>:   jmp    0x400fbe <phase_3+123>
0x0000000000400fad <+106>:   callq  0x40143a <explode_bomb>
0x0000000000400fb2 <+111>:   mov    $0x0,%eax
0x0000000000400fb7 <+116>:   jmp    0x400fbe <phase_3+123>
0x0000000000400fb9 <+118>:   mov    $0x137,%eax
0x0000000000400fbe <+123>:   cmp    0xc(%rsp),%eax
0x0000000000400fc2 <+127>:   je     0x400fc9 <phase_3+134>
0x0000000000400fc4 <+129>:   callq  0x40143a <explode_bomb>
0x0000000000400fc9 <+134>:   add    $0x18,%rsp
0x0000000000400fcd <+138>:   retq   
