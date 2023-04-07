	.file	"ft_atoi.c"
	.intel_syntax noprefix
	.text
	.globl	ft_iswhitespace
	.type	ft_iswhitespace, @function
ft_iswhitespace:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	eax, edi
	mov	BYTE PTR -4[rbp], al
	cmp	BYTE PTR -4[rbp], 32
	je	.L2
	cmp	BYTE PTR -4[rbp], 10
	je	.L2
	cmp	BYTE PTR -4[rbp], 9
	je	.L2
	cmp	BYTE PTR -4[rbp], 11
	je	.L2
	cmp	BYTE PTR -4[rbp], 13
	je	.L2
	cmp	BYTE PTR -4[rbp], 12
	jne	.L3
.L2:
	mov	eax, 1
	jmp	.L4
.L3:
	mov	eax, 0
.L4:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	ft_iswhitespace, .-ft_iswhitespace
	.section	.rodata
.LC0:
	.string	"0123456789abcdef"
.LC1:
	.string	"0123456789ABCDEF"
	.text
	.globl	base
	.type	base, @function
base:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -36[rbp], edi
	mov	DWORD PTR -40[rbp], esi
	lea	rax, .LC0[rip]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC1[rip]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L6
.L10:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	cmp	DWORD PTR -36[rbp], eax
	je	.L7
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	cmp	DWORD PTR -36[rbp], eax
	jne	.L8
.L7:
	mov	eax, DWORD PTR -20[rbp]
	jmp	.L9
.L8:
	add	DWORD PTR -20[rbp], 1
.L6:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -40[rbp]
	jl	.L10
	mov	eax, -1
.L9:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	base, .-base
	.globl	ft_atoi_base
	.type	ft_atoi_base, @function
ft_atoi_base:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L12
.L13:
	add	DWORD PTR -8[rbp], 1
.L12:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	ft_iswhitespace
	test	eax, eax
	jne	.L13
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 43
	je	.L14
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L17
.L14:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	jne	.L16
	mov	DWORD PTR -12[rbp], 1
.L16:
	add	DWORD PTR -8[rbp], 1
.L17:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edx, DWORD PTR -28[rbp]
	mov	esi, edx
	mov	edi, eax
	call	base
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	add	DWORD PTR -16[rbp], eax
	add	DWORD PTR -8[rbp], 1
	cmp	DWORD PTR -4[rbp], -1
	jne	.L17
	cmp	DWORD PTR -12[rbp], 0
	je	.L18
	mov	eax, DWORD PTR -16[rbp]
	neg	eax
	jmp	.L19
.L18:
	mov	eax, DWORD PTR -16[rbp]
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	ft_atoi_base, .-ft_atoi_base
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
