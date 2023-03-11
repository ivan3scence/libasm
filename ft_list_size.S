%ifdef LINUX
    %define M_FT_LIST_SIZE ft_list_size
%else
    %define M_FT_LIST_SIZE _ft_list_size
%endif

section .text
global M_FT_LIST_SIZE 

M_FT_LIST_SIZE:
	push	rcx
	xor		rcx, rcx
	jmp		ITER

ITER:
	mov		r8, [rdi + rcx]
	mov		rdx, [rsi + rcx]
	cmp		r8b, 0
	je		S1_ZERO
	cmp		dl, 0
	je		S2_ZERO
	cmp		r8b, dl
	ja		END1
	jb		END_1
	inc		rcx
	jmp		ITER
	
S1_ZERO:
	cmp		dl, 0
	jne		END_1
	jmp		END0

S2_ZERO:
	cmp		r8b, 0
	jne		END1
	jmp		END0

END_1:
	mov		rax, -1
	jmp		END

END1:
	mov		rax, 1
	jmp		END

END0:
	mov		rax, 0
	jmp		END

END:
	pop		rcx
	ret
