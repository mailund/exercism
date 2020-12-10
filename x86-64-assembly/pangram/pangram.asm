section .text
global is_pangram
is_pangram:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 26 + 8           ; table a-z + rbp

    mov    rsi, rdi               ; move argument to work with lodsb/stosb

    ; set the table to zero...
    ; I am not using rdi any more (the arg is in rsi), so I can use
    ; it here as my counter
    mov     rdi, 26
  .zero_table:
    dec     rdi
    mov     byte[rsp + rdi], byte 0
    jnz     .zero_table           ; this checks the result of the previous dec
    
  .fill_table:
    lodsb                         ; al := x[rsi++]
    test    al, al                ; if al is zero, we are through the input
    jz      .test_table

    ; check if we have an upper case letter
    cmp     al, 'A'
    jl      .fill_table
    cmp     al, 'Z'
    jg      .test_lower
    ; here, we are greater than A and less than Z, so
    ; we are upper case. Get the corresponding lowercase
    ; letter by adding 32
    add     al, 32
    jmp     .upd_table

  .test_lower:
    cmp     al, 'a'
    jl      .fill_table           ; handle next character
    cmp     al, 'z'
    jg      .fill_table           ; handle next character

  .upd_table:
    ; update the table
    sub     al, 'a'               ; subtract a to get indices from zero
    mov     byte[rsp + rax], 1
    ; and continue with the next letter...
    jmp     .fill_table

  .test_table: ; check if we have seen all letters here
    mov     rax,  1               ; we assume that we have a pangram until we know otherwise
    mov     rdi, 26
  .test_loop:
    dec     rdi
    js      .done                 ; if we turned negative, we are done
    mov     cl, byte[rsp + rdi]
    test    cl, cl
    jz      .test_failed
    jmp     .test_loop

  .test_failed:
    mov     rax, 0

  .done:
    add     rsp, 26 + 8           ; free table
    pop     rbp
    ret
