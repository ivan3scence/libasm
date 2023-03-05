
%define M_EXTERN_CALL_SUFFIX wrt ..plt

extern ___error
extern __errno_location
section .text ; the text section is where we'll put executable code
global ft_read ; _start is our entry point - this is its declaration...

ft_read:
	mov     rax, 0    ; read
	syscall
	cmp		rax, 0
	jl		error
	ret

error:
	neg		rax
	push	rax
    call	__errno_location M_EXTERN_CALL_SUFFIX
    pop		qword [rax]
    mov		rax, -1
	ret

;	mov     rax, 2      ; open
;	mov     rdi, path
;	xor     rsi, rsi
;	syscall

;	push    rax             ; push fd to stack
;	sub     rsp, 16         ; reserve 16 B

;	xor     rax, rax    ; read
;	mov		rdi, [rsp+16]   ; fd
;	mov     rsi, rsp        ; buf addr
;	mov     rdx, 16         ; buf size
;	syscall
;	ret

;	mov     rdx, rax        ; nb of B
;	mov     rax, 1          ; write
;	mov     rdi, 1          ; fd
;	mov     rsi, rsp        ; buf addr
;	syscall


;	mov     rax, 60   ; exit
;	mov		rdi, 228
;	syscall

;_start:
;	call ft_read

;	section .data
;path:     db    "/home/ivan/school21/libasm/test.file", 0     ; null-terminated

;  xor rdi, rdi  ; ...and this is its definition. we just set rdi to 0.
;  mov rdi, 228
;  mov rax, 60   ; exit
;  syscall
