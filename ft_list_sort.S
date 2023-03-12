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
	push 	rdx
	push 	rcx
	push 	r11
	push 	r10
	push 	r9
	push 	r8

	cmp 	rdi, 0x0
	je 		FT_LIST_SORT_END_ITER
	cmp 	qword [rdi], 0x0
	je 		FT_LIST_SORT_END_ITER
	mov 	rcx, [rdi]
	cmp 	qword [rcx + 8], 0x0
	je 		FT_LIST_SORT_END_ITER


	mov 	r9, rdi 						; list begin
	mov 	r11, rsi 						; func pointer

	mov 	r8, [r9] 						; r8 := *begin
	jmp 	FT_LIST_SORT_ITER
FT_LIST_SORT_ITER:
	cmp 	qword r8, 0x0
	je 		FT_LIST_SORT_END_ITER

	mov 	r10, [r9] 					; r10 := *begin
FT_LIST_SORT_ITER_2:
	cmp 	qword [r10 + 8], 0x0
	je 		FT_LIST_SORT_NEXT

	mov 	rdi, [r10] 					; rdi := data
	mov 	rcx, [r10 + 8] 			; rcx := next
	mov 	rsi, [rcx] 					; next->data

	push 	rdi
	push 	rsi
	push 	rcx
	push 	r11
	push 	r10
	push 	r9
	push 	r8
	mov 	rdx, r11
	push 	rdx

	xor 	rax, rax
	call 	r11

	pop 	r11
	pop 	r8
	pop 	r9
	pop 	r10
	pop 	r11
	pop 	rcx
	pop 	rsi
	pop 	rdi

	cmp 	qword rax, 0x0
	jg 		FT_LIST_SORT_GREATER
	jmp 	FT_LIST_SORT_NEXT_2 

FT_LIST_SORT_GREATER: 			; [r10] <- [r10 + 8]; [r10 + 8] <- [r10]
	mov 	[rcx], rdi
	mov 	[r10], rsi
	jmp 	FT_LIST_SORT_NEXT_2 


FT_LIST_SORT_NEXT:
	mov 	r8, [r8 + 8]
	jmp 	FT_LIST_SORT_ITER

FT_LIST_SORT_NEXT_2:
	mov 	r10, [r10 + 8]
	jmp 	FT_LIST_SORT_ITER_2

FT_LIST_SORT_END_ITER:
	pop 	r8
	pop 	r9
	pop 	r10
	pop 	r11
	pop 	rcx
	pop 	rdx
	ret



;ft_list_sort:							; rdi = t_list **begin, rsi = int (*cmp)(d1, d2)
; 		push	rbx					; save rbx (next)
; 		push	r12					; save r12 (first)
; 		cmp		rdi, 0x0				; begin == NULL
; 		jz		restore
; 		mov		r12, [rdi]			; first = *begin
; 		cmp		rsi, 0x0				; cmp == NULL
; 		jz		return
; 		jmp		compare_main
;ncrement_main:
; 		mov		rcx, [rdi]
; 		mov		rbx, [rcx + 8]
; 		mov		[rdi], rbx			; *begin = (*begin)->next
;ompare_main:
; 		cmp		QWORD [rdi], 0x0		; !*begin
; 		jz		return
; 		mov		rcx, [rdi]
; 		mov		rbx, [rcx + 8]		; current = (*begin)->next
;ompare_single:
; 		cmp		rbx, 0x0				; !current
; 		jz		increment_main
;ompare:
; 		push	rdi
; 		push	rsi
; 		mov		rax, rsi
; 		mov		rcx, [rdi]
; 		mov		rdi, [rcx]			; rdi = (*begin)->data
; 		mov		rsi, [rbx]			; rsi = current->data
; 		call	rax					; (*cmp)((*begin)->data, current->data)
; 		pop		rsi
; 		pop		rdi
; 		cmp		rax, 0x0				; cmp > 0x0
; 		jg		swap
;ncrement_single:
; 		mov		rcx, [rbx + 8]
; 		mov		rbx, rcx			; current = current.next
; 		jmp		compare_single
;wap:
; 		mov		r8, [rdi]
; 		mov		rcx, [r8]			; rcx = (*begin)->data
; 		mov		rax, [rbx]			; rax = current->data
; 		mov		[r8], rax			; (*begin)->data = current->data
; 		mov		[rbx], rcx			; current->data = (*begin)->data
; 		jmp		increment_single
;eturn:
; 		mov		[rdi], r12			; *begin = first
;estore:
; 		pop		r12					; restore r12
; 		pop		rbx					; restore rbx
; 		ret
;
;
;
;
;;M_FT_LIST_SORT:
;;    ; t_list *slow   : rax = *begin_list
;;    ; t_list *fast   : rbx = (*begin_list)->next
;;    ; t_list *middle : rsp + 0x0
;;
;;    ; === base condition ===
;;    cmp  rdi, 0x0
;;    je   FT_LIST_SORT_END              ; if begin_list == 0x0 return
;;    mov  rax, [rdi]
;;    cmp  rax, 0x0
;;    je   FT_LIST_SORT_END              ; if *begin_list == 0x0 return
;;    mov  rbx, [rax + 8]
;;    cmp  rbx, 0x0
;;    je   FT_LIST_SORT_END              ; if (*begin_list)->next == 0x0 return
;;
;;    ; === find list middle loop ===
;;FT_LIST_SORT_MIDDLE_LOOP:              ; do {
;;    mov  rbx, [rbx + 8]                ;     fast = fast->next
;;    cmp  rbx, 0x0
;;    je   FT_LIST_SORT_MIDDLE_LOOP_END  ;     if fast == 0x0 break
;;    mov  rbx, [rbx + 8]                ;     fast = fast->next
;;    mov  rax, [rax + 8]                ;     slow = slow->next
;;    cmp  rbx, 0x0
;;    jne  FT_LIST_SORT_MIDDLE_LOOP      ; } while (fast != 0x0)
;;FT_LIST_SORT_MIDDLE_LOOP_END:
;;
;;    ; create a stack frame for local variable to store middle address
;;    push rbp
;;    mov  rbp, rsp
;;    sub  rsp, 8
;;
;;    ; store middle in [rbp - 8]
;;    mov  rcx, [rax + 8]
;;    mov  [rbp - 8], rcx
;;    mov  qword [rax + 8], 0x0         ; slow->next = 0x0
;;
;;    ; === sorting both child list ===
;;    push rdi
;;    push rsi
;;    call M_FT_LIST_SORT                 ; ft_list_sort(begin_list, cmp)
;;    lea  rdi, [rbp - 8]
;;    call M_FT_LIST_SORT                 ; ft_list_sort(&middle, cmp)
;;    pop  rsi
;;    pop  rdi
;;
;;    ; === merging sorted child ===
;;    push rdi
;;    push rsi
;;    mov  rdi, [rdi]                    ; arg_1 = *begin_list
;;    mov  rdx, rsi                      ; arg_3 = cmp
;;    mov  rsi, [rbp - 8]                ; arg_2 = middle
;;    call _st_merge_sorted_list
;;    pop  rsi
;;    pop  rdi
;;    mov  [rdi], rax                    ; *begin_list = st_merge_sorted_list(...);
;;
;;    ; restoring stack frame
;;    mov  rsp, rbp
;;    pop  rbp
;;FT_LIST_SORT_END:
;;    ret
;;
;;
;;; t_list *st_merge_sorted_list(t_list* l1, t_list* l2, int (*cmp)(void*, void*))
;;_st_merge_sorted_list:
;;    cmp  rdi, 0x0
;;    je   MERGE_SORTED_LIST_RETURN_L2   ; if l1 == 0x0 return l2
;;    cmp  rsi, 0x0
;;    je   MERGE_SORTED_LIST_RETURN_L1   ; if l2 == 0x0 return l1
;;
;;    push rdi
;;    push rsi
;;    push rdx
;;    mov  rdi, [rdi + 0x0]                ; l1->data
;;    mov  rsi, [rsi + 0x0]                ; l2->data
;;    xor  rax, rax
;;    call rdx                           ; cmp
;;    pop  rdx
;;    pop  rsi
;;    pop  rdi
;;
;;    cmp  eax, 0x0
;;    jl   MERGE_SORTED_LIST_L1_LT_L2
;;
;;    ; if l1 >= l2
;;    push rsi                           ; save l2
;;    mov  rsi, [rsi + 8]                ; l2 = l2->next
;;    call _st_merge_sorted_list         ; merge_sorted_list(l1, l2->next, cmp)
;;    pop  rsi                           ; restore rsi
;;    mov  [rsi + 8], rax
;;    mov  rax, rsi
;;    jmp  MERGE_SORTED_LIST_END
;;    ; else
;;MERGE_SORTED_LIST_L1_LT_L2:
;;    push rdi
;;    mov  rdi, [rdi + 8]
;;    call _st_merge_sorted_list         ; merge_sort_list(l1->next, l2, cmp)
;;    pop  rdi
;;    mov  [rdi + 8], rax
;;    mov  rax, rdi
;;    jmp  MERGE_SORTED_LIST_END
;;
;;MERGE_SORTED_LIST_RETURN_L1:
;;    mov  rax, rdi
;;    ret
;;MERGE_SORTED_LIST_RETURN_L2:
;;    mov  rax, rsi
;;MERGE_SORTED_LIST_END:
;;    ret
;
;;
