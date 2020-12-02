default rel

section .data
one_for_prefix: db "One for ", 0
one_for_suffix: db ", one for me.", 0
you:            db "you", 0

section .text
; I use this as a helper "function", although I
; simply execute it and do not call it with a propper
; 'call' and with the argument interface.
; The function will copy a zero-terminated string from one
; buffer to another. The destination address is in rsi.
; That way I can just use the destination from the two_fer
; function plus the current counter.
; The source is in r8 and the return instruction is in r9.
; When done, rax has the number of bytes copied, so we can
; use it to update the buffer for the next copy
copy:
    xor rax, rax           ; FIXME: why is this better for setting
                           ; the register to zero?
  .copy_loop:
    ; get the next character, and finish if it is zero
    mov cl, byte[r8 + rax]
    cmp cl, 0
    je .done                   ; if zero, we are done...
    mov byte[rsi + rax], cl    ; otherwise, write it to output
    inc rax
    jmp .copy_loop
  .done:
    jmp r9

global two_fer
two_fer:
    ; Arguments: name is in rdi, out buffer in rsi...

    ; If the name is NULL we need to update it
    ; to "you"
    cmp rdi, 0
    jne .copy_prefix
    lea rdi, you

  .copy_prefix:
    lea r8, one_for_prefix  ; copy from...
    lea r9, .copy_name      ; continue from...
    jmp copy                ; go!

  .copy_name:
    add rsi, rax            ; continue copying from last byte...
    mov r8, rdi
    lea r9, .copy_suffix
    jmp copy

  .copy_suffix:
    add rsi, rax             ; continue copying from last byte...
    lea r8, one_for_suffix
    lea r9, .done
    jmp copy

  .done:
    mov byte[rsi + rax], 0 ; zero terminate output
    ret
