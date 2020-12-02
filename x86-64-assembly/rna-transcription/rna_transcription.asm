section .text


; Translate an RNA string in rdi and put it in a buffer
; pointed to by rsi
global to_rna
to_rna:
    xchg rdi, rsi ; flip these to work with lodsb/stosb
    jmp .read_input

  .write_output:
    stosb                   ; out[rsi++] = al

  .read_input:
    lodsb                   ; al := x[rdi++]
    test al, al
    jz .done

    ; translate...
    cmp al, 'C'
    je .C
    cmp al, 'T'
    je .T
    cmp al, 'A'
    je .A
    ; If it isn't one of those, assume that it is G

  .G: ; G -> C
    mov al, 'C'
    jmp .write_output
  .C: ; C -> G
    mov al, 'G'
    jmp .write_output
  .T: ; T -> A
    mov al, 'A'
    jmp .write_output
  .A: ; A -> U
    mov al, 'U'
    jmp .write_output

  .done:
    ; zero-terminate the output buffer and return
    stosb
    ret
