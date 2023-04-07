; GNU C17 (GCC) version 12.2.1 20230201 (x86_64-pc-linux-gnu)
;	compiled by GNU C version 12.2.1 20230201, GMP version 6.2.1, MPFR version 4.2.0, MPC version 1.3.1, isl version isl-0.25-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -masm=intel -mtune=generic -march=x86-64 -Og
section	.text
global	ft_atoi

ft_atoi:
	mov	rsi, rdi	; str, tmp126
; ft_atoi.c:22:   i = 0;
	mov	edx, 0	; i,
; ft_atoi.c:23:   while ((str[i]) && (((str[i] > 8) && (str[i] < 14)) || (str[i] == 32)))
	jmp	.L2	;
.L4:
; ft_atoi.c:24:     i++;
	add	edx, 1	; i,
.L2:
; ft_atoi.c:23:   while ((str[i]) && (((str[i] > 8) && (str[i] < 14)) || (str[i] == 32)))
	movsx	rax, edx	; i, i
	movzx	eax, BYTE [rsi+rax]	; _3, *_2
; ft_atoi.c:23:   while ((str[i]) && (((str[i] > 8) && (str[i] < 14)) || (str[i] == 32)))
	test	al, al	; _3
	je	.L3	;,
; ft_atoi.c:23:   while ((str[i]) && (((str[i] > 8) && (str[i] < 14)) || (str[i] == 32)))
	lea	ecx, -9[rax]	; tmp110,
	cmp	cl, 4	; tmp110,
	setbe	cl	;, tmp112
	cmp	al, 32	; _3,
	sete	dil	;, tmp114
; ft_atoi.c:23:   while ((str[i]) && (((str[i] > 8) && (str[i] < 14)) || (str[i] == 32)))
	or	cl, dil	; tmp127, tmp114
	jne	.L4	;,
.L3:
; ft_atoi.c:25:   if (str[i] == 45 || str[i] == 43) {
	cmp	al, 45	; _3,
	sete	cl	;, tmp116
	cmp	al, 43	; _3,
	sete	dil	;, tmp118
; ft_atoi.c:25:   if (str[i] == 45 || str[i] == 43) {
	or	cl, dil	; tmp128, tmp118
	je	.L9	;,
; ft_atoi.c:26:     if (str[i++] == 45)
	add	edx, 1	; i,
; ft_atoi.c:26:     if (str[i++] == 45)
	cmp	al, 45	; _3,
	je	.L10	;,
; ft_atoi.c:20:   k = 1;
	mov	r8d, 1	; k,
	jmp	.L5	;
.L13:
; ft_atoi.c:33:         return (-1);
	mov	eax, -1	; <retval>,
	ret	
.L9:
; ft_atoi.c:20:   k = 1;
	mov	r8d, 1	; k,
.L5:
	mov	eax, 0	; n,
.L6:
; ft_atoi.c:29:   while (str[i] && !(str[i] < 48 || str[i] > 57)) {
	movsx	rcx, edx	; i, i
	movzx	ecx, BYTE [rsi+rcx]	; _17, *_16
; ft_atoi.c:29:   while (str[i] && !(str[i] < 48 || str[i] > 57)) {
	lea	edi, -48[rcx]	; tmp124,
	cmp	dil, 9	; tmp124,
	ja	.L12	;,
; ft_atoi.c:30:     n = n * 10 + str[i++] - 48;
	lea	rax, [rax+rax*4]	; tmp121,
; ft_atoi.c:30:     n = n * 10 + str[i++] - 48;
	add	edx, 1	; i,
; ft_atoi.c:30:     n = n * 10 + str[i++] - 48;
	movsx	rcx, cl	; _13, _17
; ft_atoi.c:30:     n = n * 10 + str[i++] - 48;
	lea	rax, -48[rcx+rax*2]	; n,
; ft_atoi.c:31:     if (n < 0) {
	test	rax, rax	; n
	jns	.L6	;,
; ft_atoi.c:32:       if (k > 0)
	test	r8, r8	; k
	jg	.L13	;,
; ft_atoi.c:34:       return (0);
	mov	eax, 0	; <retval>,
; ft_atoi.c:38: }
	ret	
.L10:
; ft_atoi.c:27:       k = -1;
	mov	r8, -1	; k,
	jmp	.L5	;
.L12:
; ft_atoi.c:37:   return (n * k);
	imul	eax, r8d	; <retval>, k
	ret	

