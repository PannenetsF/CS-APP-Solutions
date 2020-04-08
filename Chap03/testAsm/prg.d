
prg:     file format elf64-x86-64


Disassembly of section .init:

0000000000000570 <_init>:
 570:	48 83 ec 08          	sub    $0x8,%rsp
 574:	48 8b 05 6d 0a 20 00 	mov    0x200a6d(%rip),%rax        # 200fe8 <__gmon_start__>
 57b:	48 85 c0             	test   %rax,%rax
 57e:	74 02                	je     582 <_init+0x12>
 580:	ff d0                	callq  *%rax
 582:	48 83 c4 08          	add    $0x8,%rsp
 586:	c3                   	retq   

Disassembly of section .plt:

0000000000000590 <.plt>:
 590:	ff 35 22 0a 20 00    	pushq  0x200a22(%rip)        # 200fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
 596:	ff 25 24 0a 20 00    	jmpq   *0x200a24(%rip)        # 200fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
 59c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000005a0 <__stack_chk_fail@plt>:
 5a0:	ff 25 22 0a 20 00    	jmpq   *0x200a22(%rip)        # 200fc8 <__stack_chk_fail@GLIBC_2.4>
 5a6:	68 00 00 00 00       	pushq  $0x0
 5ab:	e9 e0 ff ff ff       	jmpq   590 <.plt>

00000000000005b0 <__printf_chk@plt>:
 5b0:	ff 25 1a 0a 20 00    	jmpq   *0x200a1a(%rip)        # 200fd0 <__printf_chk@GLIBC_2.3.4>
 5b6:	68 01 00 00 00       	pushq  $0x1
 5bb:	e9 d0 ff ff ff       	jmpq   590 <.plt>

Disassembly of section .plt.got:

00000000000005c0 <__cxa_finalize@plt>:
 5c0:	ff 25 32 0a 20 00    	jmpq   *0x200a32(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 5c6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000005d0 <_start>:
 5d0:	31 ed                	xor    %ebp,%ebp
 5d2:	49 89 d1             	mov    %rdx,%r9
 5d5:	5e                   	pop    %rsi
 5d6:	48 89 e2             	mov    %rsp,%rdx
 5d9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 5dd:	50                   	push   %rax
 5de:	54                   	push   %rsp
 5df:	4c 8d 05 da 01 00 00 	lea    0x1da(%rip),%r8        # 7c0 <__libc_csu_fini>
 5e6:	48 8d 0d 63 01 00 00 	lea    0x163(%rip),%rcx        # 750 <__libc_csu_init>
 5ed:	48 8d 3d e6 00 00 00 	lea    0xe6(%rip),%rdi        # 6da <main>
 5f4:	ff 15 e6 09 20 00    	callq  *0x2009e6(%rip)        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 5fa:	f4                   	hlt    
 5fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000600 <deregister_tm_clones>:
 600:	48 8d 3d 09 0a 20 00 	lea    0x200a09(%rip),%rdi        # 201010 <__TMC_END__>
 607:	55                   	push   %rbp
 608:	48 8d 05 01 0a 20 00 	lea    0x200a01(%rip),%rax        # 201010 <__TMC_END__>
 60f:	48 39 f8             	cmp    %rdi,%rax
 612:	48 89 e5             	mov    %rsp,%rbp
 615:	74 19                	je     630 <deregister_tm_clones+0x30>
 617:	48 8b 05 ba 09 20 00 	mov    0x2009ba(%rip),%rax        # 200fd8 <_ITM_deregisterTMCloneTable>
 61e:	48 85 c0             	test   %rax,%rax
 621:	74 0d                	je     630 <deregister_tm_clones+0x30>
 623:	5d                   	pop    %rbp
 624:	ff e0                	jmpq   *%rax
 626:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 62d:	00 00 00 
 630:	5d                   	pop    %rbp
 631:	c3                   	retq   
 632:	0f 1f 40 00          	nopl   0x0(%rax)
 636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 63d:	00 00 00 

0000000000000640 <register_tm_clones>:
 640:	48 8d 3d c9 09 20 00 	lea    0x2009c9(%rip),%rdi        # 201010 <__TMC_END__>
 647:	48 8d 35 c2 09 20 00 	lea    0x2009c2(%rip),%rsi        # 201010 <__TMC_END__>
 64e:	55                   	push   %rbp
 64f:	48 29 fe             	sub    %rdi,%rsi
 652:	48 89 e5             	mov    %rsp,%rbp
 655:	48 c1 fe 03          	sar    $0x3,%rsi
 659:	48 89 f0             	mov    %rsi,%rax
 65c:	48 c1 e8 3f          	shr    $0x3f,%rax
 660:	48 01 c6             	add    %rax,%rsi
 663:	48 d1 fe             	sar    %rsi
 666:	74 18                	je     680 <register_tm_clones+0x40>
 668:	48 8b 05 81 09 20 00 	mov    0x200981(%rip),%rax        # 200ff0 <_ITM_registerTMCloneTable>
 66f:	48 85 c0             	test   %rax,%rax
 672:	74 0c                	je     680 <register_tm_clones+0x40>
 674:	5d                   	pop    %rbp
 675:	ff e0                	jmpq   *%rax
 677:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 67e:	00 00 
 680:	5d                   	pop    %rbp
 681:	c3                   	retq   
 682:	0f 1f 40 00          	nopl   0x0(%rax)
 686:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 68d:	00 00 00 

0000000000000690 <__do_global_dtors_aux>:
 690:	80 3d 79 09 20 00 00 	cmpb   $0x0,0x200979(%rip)        # 201010 <__TMC_END__>
 697:	75 2f                	jne    6c8 <__do_global_dtors_aux+0x38>
 699:	48 83 3d 57 09 20 00 	cmpq   $0x0,0x200957(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 6a0:	00 
 6a1:	55                   	push   %rbp
 6a2:	48 89 e5             	mov    %rsp,%rbp
 6a5:	74 0c                	je     6b3 <__do_global_dtors_aux+0x23>
 6a7:	48 8b 3d 5a 09 20 00 	mov    0x20095a(%rip),%rdi        # 201008 <__dso_handle>
 6ae:	e8 0d ff ff ff       	callq  5c0 <__cxa_finalize@plt>
 6b3:	e8 48 ff ff ff       	callq  600 <deregister_tm_clones>
 6b8:	c6 05 51 09 20 00 01 	movb   $0x1,0x200951(%rip)        # 201010 <__TMC_END__>
 6bf:	5d                   	pop    %rbp
 6c0:	c3                   	retq   
 6c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 6c8:	f3 c3                	repz retq 
 6ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000006d0 <frame_dummy>:
 6d0:	55                   	push   %rbp
 6d1:	48 89 e5             	mov    %rsp,%rbp
 6d4:	5d                   	pop    %rbp
 6d5:	e9 66 ff ff ff       	jmpq   640 <register_tm_clones>

00000000000006da <main>:
 6da:	48 83 ec 18          	sub    $0x18,%rsp
 6de:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 6e5:	00 00 
 6e7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
 6ec:	31 c0                	xor    %eax,%eax
 6ee:	48 89 e2             	mov    %rsp,%rdx
 6f1:	be 03 00 00 00       	mov    $0x3,%esi
 6f6:	bf 02 00 00 00       	mov    $0x2,%edi
 6fb:	e8 41 00 00 00       	callq  741 <multstore>
 700:	48 8b 14 24          	mov    (%rsp),%rdx
 704:	48 8d 35 c9 00 00 00 	lea    0xc9(%rip),%rsi        # 7d4 <_IO_stdin_used+0x4>
 70b:	bf 01 00 00 00       	mov    $0x1,%edi
 710:	b8 00 00 00 00       	mov    $0x0,%eax
 715:	e8 96 fe ff ff       	callq  5b0 <__printf_chk@plt>
 71a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
 71f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 726:	00 00 
 728:	75 0a                	jne    734 <main+0x5a>
 72a:	b8 00 00 00 00       	mov    $0x0,%eax
 72f:	48 83 c4 18          	add    $0x18,%rsp
 733:	c3                   	retq   
 734:	e8 67 fe ff ff       	callq  5a0 <__stack_chk_fail@plt>

0000000000000739 <mult2>:
 739:	48 89 f8             	mov    %rdi,%rax
 73c:	48 0f af c6          	imul   %rsi,%rax
 740:	c3                   	retq   

0000000000000741 <multstore>:
 741:	53                   	push   %rbx
 742:	48 89 d3             	mov    %rdx,%rbx
 745:	e8 ef ff ff ff       	callq  739 <mult2>
 74a:	48 89 03             	mov    %rax,(%rbx)
 74d:	5b                   	pop    %rbx
 74e:	c3                   	retq   
 74f:	90                   	nop

0000000000000750 <__libc_csu_init>:
 750:	41 57                	push   %r15
 752:	41 56                	push   %r14
 754:	49 89 d7             	mov    %rdx,%r15
 757:	41 55                	push   %r13
 759:	41 54                	push   %r12
 75b:	4c 8d 25 4e 06 20 00 	lea    0x20064e(%rip),%r12        # 200db0 <__frame_dummy_init_array_entry>
 762:	55                   	push   %rbp
 763:	48 8d 2d 4e 06 20 00 	lea    0x20064e(%rip),%rbp        # 200db8 <__init_array_end>
 76a:	53                   	push   %rbx
 76b:	41 89 fd             	mov    %edi,%r13d
 76e:	49 89 f6             	mov    %rsi,%r14
 771:	4c 29 e5             	sub    %r12,%rbp
 774:	48 83 ec 08          	sub    $0x8,%rsp
 778:	48 c1 fd 03          	sar    $0x3,%rbp
 77c:	e8 ef fd ff ff       	callq  570 <_init>
 781:	48 85 ed             	test   %rbp,%rbp
 784:	74 20                	je     7a6 <__libc_csu_init+0x56>
 786:	31 db                	xor    %ebx,%ebx
 788:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 78f:	00 
 790:	4c 89 fa             	mov    %r15,%rdx
 793:	4c 89 f6             	mov    %r14,%rsi
 796:	44 89 ef             	mov    %r13d,%edi
 799:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 79d:	48 83 c3 01          	add    $0x1,%rbx
 7a1:	48 39 dd             	cmp    %rbx,%rbp
 7a4:	75 ea                	jne    790 <__libc_csu_init+0x40>
 7a6:	48 83 c4 08          	add    $0x8,%rsp
 7aa:	5b                   	pop    %rbx
 7ab:	5d                   	pop    %rbp
 7ac:	41 5c                	pop    %r12
 7ae:	41 5d                	pop    %r13
 7b0:	41 5e                	pop    %r14
 7b2:	41 5f                	pop    %r15
 7b4:	c3                   	retq   
 7b5:	90                   	nop
 7b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7bd:	00 00 00 

00000000000007c0 <__libc_csu_fini>:
 7c0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000000007c4 <_fini>:
 7c4:	48 83 ec 08          	sub    $0x8,%rsp
 7c8:	48 83 c4 08          	add    $0x8,%rsp
 7cc:	c3                   	retq   
