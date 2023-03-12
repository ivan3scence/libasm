%ifdef LINUX
    %define M_FT_LIST_SORT ft_list_sort
    %define M_MALLOC malloc
%else
    %define M_FT_LIST_SORT _ft_list_sort
    %define M_MALLOC _malloc
%endif

extern M_MALLOC
section .text
global M_FT_LIST_SORT 

M_FT_LIST_SORT:
	cmp 	rdi, 0
	je 		FT_LIST_SORT_END
	cmp 	qword [rdi + 8], 0
	je 		FT_LIST_SORT_END

	mov 	r9, rdi 						; list begin
	mov 	r11, rsi 						; func pointer

	mov 	r8, [r9]
FT_LIST_SORT_ITER:
	cmp 	r8, 0
	je 		FT_LIST_SORT_END

	mov 	r10, [r9]
FT_LIST_SORT_ITER_2:
	cmp 	r10, 0
	je 		FT_LIST_SORT_NEXT

	push 	rcx
	mov 	rdi, [r10] 					; rdi := data
	mov 	rcx, [r10 + 8] 			; rcx := next
	mov 	rsi, [rcx] 					; next->data
	pop 	rcx
	call 	r11
	cmp 	rax, 0
	jg 		FT_LIST_SORT_GREATER
	jmp 	FT_LIST_SORT_NEXT_2 

FT_LIST_SORT_GREATER:
	mov 	rdx, [r10] 					; store data
	push 	rcx
	mov 	rcx, [r10 + 8] 			; store next
	mov 	rcx, [rcx] 					; rcx = next->data
	mov 	[r10], rcx 				; data := next->data
	;mov 	rcx, [rcx]
	mov 	rcx, rdx 					; next->data := data
	pop 	rcx
	jmp 	FT_LIST_SORT_NEXT_2 


FT_LIST_SORT_NEXT:
	mov 	r8, [r8 + 8]
	jmp 	FT_LIST_SORT_ITER

FT_LIST_SORT_NEXT_2:
	mov 	r10, [r10 + 8]
	jmp 	FT_LIST_SORT_ITER_2

FT_LIST_SORT_END:
	ret

