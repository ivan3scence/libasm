%ifdef LINUX
    %define M_EXTERN_CALL_SUFFIX wrt ..plt
    %define M_FT_STRLEN ft_strlen
    %define M_ERRNO_LOCATION __errno_location
    %define M_SYSCALL_STRLEN 0x1
%else
    %define M_EXTERN_CALL_SUFFIX
    %define M_FT_STRLEN _ft_strlen
    %define M_ERRNO_LOCATION ___error
    %define M_SYSCALL_STRLEN 0x2000004
%endif

%define M_EXTERN_CALL_SUFFIX 
extern M_ERRNO_LOCATION
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

