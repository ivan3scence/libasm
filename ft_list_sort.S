%ifdef LINUX
    %define M_FT_LIST_PUSH_FRONT ft_list_push_front
    %define M_MALLOC malloc
%else
    %define M_FT_LIST_PUSH_FRONT _ft_list_push_front
    %define M_MALLOC _malloc
%endif

extern M_MALLOC
section .text
global M_FT_LIST_PUSH_FRONT 

M_FT_LIST_PUSH_FRONT:
	cmp 	rdi, 0
	je 		FT_LIST_PUSH_FRONT_END
	push 	rdi
	push 	rsi
	xor 	rdi, rdi
	mov 	edi, 16
%ifdef LINUX
    call    M_MALLOC wrt ..plt
%else
    call    M_MALLOC
%endif
	cmp 	rax, 0
	je 		FT_LIST_PUSH_FRONT_MALLOC_ERROR
	pop 	rsi
	pop 	rdi
	mov 	qword [rax + 0], rsi
	mov 	r8, [rdi]
	mov 	[rax + 8], r8
	mov 	[rdi], rax
	jmp 	FT_LIST_PUSH_FRONT_END

FT_LIST_PUSH_FRONT_MALLOC_ERROR:
	pop 	rsi
	pop 	rdi
	jmp 	FT_LIST_PUSH_FRONT_END

FT_LIST_PUSH_FRONT_END:
	ret



