%ifdef LINUX
    %define M_EXTERN_CALL_SUFFIX wrt ..plt
    %define M_FT_STRCPY ft_strcpy
    %define M_ERRNO_LOCATION __errno_location
    %define M_SYSCALL_STRCPY 0x1
%else
    %define M_EXTERN_CALL_SUFFIX
    %define M_FT_STRCPY _ft_strcpy
    %define M_ERRNO_LOCATION ___error
    %define M_SYSCALL_STRCPY 0x2000004
%endif

%define M_EXTERN_CALL_SUFFIX 
extern M_ERRNO_LOCATION
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

