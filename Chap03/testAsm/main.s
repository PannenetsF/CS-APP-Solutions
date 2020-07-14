	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	process
	.type	process, @function
process:
.LFB0:
	.cfi_startproc
	mov	rax, rdi
	mov	rdx, QWORD PTR 16[rsp]
	mov	QWORD PTR [rdi], rdx
	mov	rdx, QWORD PTR 8[rsp]
	mov	QWORD PTR 8[rdi], rdx
	mov	rdx, QWORD PTR 24[rsp]
	mov	rdx, QWORD PTR [rdx]
	mov	QWORD PTR 16[rdi], rdx
	ret
	.cfi_endproc
.LFE0:
	.size	process, .-process
	.ident	"GCC: (GNU) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
