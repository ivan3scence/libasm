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
    call    M_MALLOC wrt ..plt
    cmp     rax, 0
    je      END
    pop     rsi
    mov     rdi, rax
    call    M_FT_STRCPY
    ret

END:
    pop     rdi 
    ret
