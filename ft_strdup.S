%ifdef LINUX
    %define M_EXTERN_CALL_SUFFIX wrt ..plt
    %define M_FT_STRDUP ft_strdup
    %define M_FT_STRLEN ft_strlen
    %define M_FT_STRCPY ft_strcpy
    %define M_ERRNO_LOCATION __errno_location
    %define M_MALLOC malloc
%else
    %define M_EXTERN_CALL_SUFFIX
    %define M_FT_STRDUP _ft_strdup
    %define M_FT_STRLEN _ft_strlen
    %define M_FT_STRCPY _ft_strcpy
    %define M_ERRNO_LOCATION ___error
    %define M_MALLOC _malloc
%endif

extern M_MALLOC
extern M_FT_STRCPY
extern M_FT_STRLEN

section .text
global M_FT_STRDUP 

M_FT_STRDUP:
    push    rdi
    call    M_FT_STRLEN
    inc     rax
    mov     rdi, rax
%ifdef LINUX
    call    M_MALLOC wrt ..plt
%else
    call    M_MALLOC
%endif
    cmp     rax, 0
    je      STRDUP_MALLOC_ERROR
    mov     rdi, rax
    pop     rsi
    call    M_FT_STRCPY
    ret

STRDUP_MALLOC_ERROR:
    pop     rdi
    ret

