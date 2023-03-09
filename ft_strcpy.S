%ifdef LINUX
    %define M_FT_STRCPY ft_strcpy
%else
    %define M_FT_STRCPY _ft_strcpy
%endif

section .text
global M_FT_STRCPY 

M_FT_STRCPY:
	push	rcx
	xor		rcx, rcx
	jmp		ITER

ITER:
	mov		rdx, [rsi + rcx]
	mov		[rdi + rcx], rdx
	cmp		rdx, byte 0
	jz		NULL_BYTE
	inc		rcx
	jmp		ITER
	
NULL_BYTE:
	mov		rax, rdi
	pop		rcx
	ret

