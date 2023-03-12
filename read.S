%ifdef LINUX
    %define M_EXTERN_CALL_SUFFIX wrt ..plt
    %define M_FT_READ ft_read
    %define M_ERRNO_LOCATION __errno_location
    %define M_SYSCALL_READ 0x0
%else
    %define M_EXTERN_CALL_SUFFIX
    %define M_FT_READ _ft_read
    %define M_ERRNO_LOCATION ___error
    %define M_SYSCALL_READ 0x2000003
%endif

%define M_EXTERN_CALL_SUFFIX 
extern M_ERRNO_LOCATION
;extern Mx
section .text ; the text section is where we'll put executable code
global M_FT_READ ; _start is our entry point - this is its declaration...

M_FT_READ:
    mov  rax, M_SYSCALL_READ
    syscall
%ifdef LINUX
    cmp  rax, 0
    jl   FT_READ_ERROR
%else
    jc   FT_READ_ERROR
%endif
    ret
FT_READ_ERROR:
%ifdef LINUX
    neg  rax
%endif
    push rax
%ifdef LINUX
    call __errno_location wrt ..plt
%else
    call M_ERRNO_LOCATION
%endif
    pop  qword [rax]
    mov  rax, -1
    ret



;	mov     rax, 0    ; read
;	syscall
;	cmp		rax, 0
;	jl		error
;	ret
;
;error:
;	neg		rax
;	push	rax
;    call	M_ERRNO_LOCATION M_EXTERN_CALL_SUFFIX
;    pop		qword [rax]
;    mov		rax, -1
;	ret

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
