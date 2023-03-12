	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 12, 1
	.globl	_new_elem                       ## -- Begin function new_elem
	.p2align	4, 0x90
_new_elem:                              ## @new_elem
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB0_2
## %bb.1:
	movl	$228, %edi
	callq	_exit
LBB0_2:
	movq	-16(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, (%rax)
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_elem_array                     ## -- Begin function elem_array
	.p2align	4, 0x90
_elem_array:                            ## @elem_array
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -36(%rbp)
	cmpq	$0, -16(%rbp)
	jne	LBB1_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB1_6
LBB1_2:
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_new_elem
	movq	%rax, -24(%rbp)
	movq	%rax, -32(%rbp)
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$-1, %rcx
	movq	%rcx, -16(%rbp)
	cmpq	$1, %rax
	jbe	LBB1_5
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	movslq	%eax, %rdi
	callq	_new_elem
	movq	%rax, %rcx
	movq	-32(%rbp), %rax
	movq	%rcx, 8(%rax)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	jmp	LBB1_3
LBB1_5:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB1_6:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$33333, %edi                    ## imm = 0x8235
	callq	_malloc
	movq	%rax, -16(%rbp)
	movl	$4, %edi
	callq	_elem_array
	movq	%rax, -32(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rdi
	callq	_ft_list_size
	movl	%eax, %esi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.1(%rip), %rdi
	movl	$16, %esi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rdi
	movl	$3735928495, %esi               ## imm = 0xDEADBEAF
	callq	_ft_list_push_front
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rsi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	8(%rax), %rsi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-32(%rbp), %rsi
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-16(%rbp), %rdi
	callq	_free
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"ft_list_size: %d\n"

L_.str.1:                               ## @.str.1
	.asciz	"sizeof: %ld\n"

L_.str.2:                               ## @.str.2
	.asciz	"ft_list_push_front: %p\n"

.subsections_via_symbols
