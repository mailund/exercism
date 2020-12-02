section .text


; Translate an RNA string in rdi and put it in a buffer
; pointed to by rsi
global to_rna
to_rna:
    ; start at index -1, because we increment rax at the
    ; beginning of each loop iteration. It makes the control
    ; flow easier, because we can simply compute a jump per
    ; character, emit the translated character, and then jump
    ; back to the beginning of the loop.
    mov rax, -1

  .translate_loop:
    inc rax
    mov cl, byte[rdi + rax]
    cmp cl, 0
    je .done

    cmp cl, 'C'
    je .C
    cmp cl, 'T'
    je .T
    cmp cl, 'A'
    je .A
    ; If it isn't one of those, assume that it is G

  .G: ; G -> C
    mov byte[rsi + rax], 'C'
    jmp .translate_loop
  .C: ; C -> G
    mov byte[rsi + rax], 'G'
    jmp .translate_loop
  .T: ; T -> A
    mov byte[rsi + rax], 'A'
    jmp .translate_loop
  .A: ; A -> U
    mov byte[rsi + rax], 'U'
    jmp .translate_loop

  .done:
    ; zero-terminate the output buffer and return
    mov byte[rsi + rax], 0
    ret
