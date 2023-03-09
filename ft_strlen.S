%ifdef LINUX
    %define M_FT_STRLEN ft_strlen
%else
    %define M_FT_STRLEN _ft_strlen
%endif

section .text
global M_FT_STRLEN 

M_FT_STRLEN:
	push	rbx
	push	rcx
	mov		rbx, rdi
	xor		al, al
	mov		rcx, 0xffffffff
	repne	scasb
	sub		rdi, rbx
	dec		rdi
	mov		rax, rdi
	pop		rcx
	pop		rbx
	ret

;M_FT_STRLEN:
;	push	rcx
;	xor		rcx, rcx
;
;ITER:
;	cmp		[rdi], byte 0
;	jz		NULL_BYTE
;	inc		rcx
;	inc		rdi
;	jmp		ITER
;	
;NULL_BYTE:
;	mov		rax, rcx
;	pop		rcx
;	ret

