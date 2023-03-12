%ifdef LINUX
    %define M_FT_LIST_PUSH_FRONT ft_list_push_front
%else
    %define M_FT_LIST_PUSH_FRONT _ft_list_push_front
%endif

section .text
global M_FT_LIST_PUSH_FRONT 

M_FT_LIST_PUSH_FRONT:
	mov 	[rsi + 8], rdi
	mov 	[rdi], rsi
	ret
