default rel

section .data
one_for_prefix: db "One for ", 0
one_for_suffix: db ", one for me.", 0
you:            db "you", 0

section .text
copy:
    ; This function will copy a zero-terminated string from one
    ; buffer to another.
    ; Input are in rdi & rsi, we copy rsi <- rdi, we return length in rax.
    ; We copy in this direction because it makes it easier to work with
    ; the two_fer() function, but it is opposite the direction for
    ; strcpy().
    mov rax, 0
  .copy_loop:
    cmp byte[rdi + rax], 0 ; do we point to zero?
    je .done               ; then we are done

    ; FIXME: I don't know if I can move a byte smarter...
    mov cl, byte[rdi + rax]
    mov byte[rsi + rax], cl
    inc rax
    jmp .copy_loop

  .done:
    ret

global two_fer
two_fer:
    ; save the name for later...
    cmp rdi, 0
    jne .save_name
    lea rdi, [you]
  .save_name:
    ; Put the name in r12. Called functions are responsible
    ; for preserving rbp, rbx, and r12-r15, so we can safely
    ; use r12
    mov r12, rdi

    ; the output buffer is in rsi, so copy into it
    ; from rdi
    lea rdi, [one_for_prefix]
    call copy

    ; copy the name...
    mov rdi, r12
    add rsi, rax ; continue copying from last byte...
    call copy

    ; copy the suffix
    lea rdi, [one_for_suffix]
    add rsi, rax ; continue copying from last byte...
    call copy

    mov byte[rsi + rax], 0 ; zero terminate

    ret
