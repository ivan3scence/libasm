%ifdef LINUX
    %define M_FT_LIST_SIZE ft_list_size
%else
    %define M_FT_LIST_SIZE _ft_list_size
%endif

section .text
global M_FT_LIST_SIZE 

M_FT_LIST_SIZE:
	xor 	rax, rax
	jmp 	FT_LIST_SIZE_ITER

FT_LIST_SIZE_ITER:
	cmp 	rdi, 0
	je 		LAST_ELEM
	inc 	rax
	add 	rdi, 8
	mov 	rdi, [rdi]
	jmp 	FT_LIST_SIZE_ITER

LAST_ELEM:
	ret
