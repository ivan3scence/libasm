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
	jmp		CPY_ITER

CPY_ITER:
	mov		dl, [rsi + rcx]
	mov		[rdi + rcx], dl
	cmp		dl, 0
	jz		CPY_NULL_BYTE
	inc		rcx
	jmp		CPY_ITER
	
CPY_NULL_BYTE:
	mov		rax, rdi
	pop		rcx
	ret

