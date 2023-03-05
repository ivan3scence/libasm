	.file	"glib_read.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"test.file"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	esi, 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	open@PLT
	mov	DWORD PTR -36[rbp], eax
	lea	rcx, -32[rbp]
	mov	eax, DWORD PTR -36[rbp]
	mov	edx, 16
	mov	rsi, rcx
	mov	edi, eax
	call	read@PLT
	mov	BYTE PTR -16[rbp], 0
	lea	rax, -32[rbp]
	mov	edx, 17
	mov	rsi, rax
	mov	edi, 1
	call	write@PLT
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Gentoo 12.2.1_p20230121-r1 p10) 12.2.1 20230121"
	.section	.note.GNU-stack,"",@progbits
