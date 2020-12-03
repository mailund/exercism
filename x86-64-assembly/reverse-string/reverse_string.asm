default rel
extern strlen

section .text
global reverse
reverse:
    ; Get the length of the input via strlen()
    push rdi      ; Remember the input, and align stack pointer
    call strlen
    pop rdi       ; Get the input and stack pointer alignment back

    ; The length is in rax now, so point it to the length from
    ; the input string
    add rax, rdi
    dec rax ; point at the last character before '\0'


  .rev_loop:
    cmp rax, rdi  ; if end <= beg we are done
    jle .done

    ; Swap x[beg] and x[end]...
    mov cl, byte[rdi]
    mov dl, byte[rax]
    mov byte[rdi], dl
    mov byte[rax], cl

    ; beg++ and end-- and repeat loop.
    inc rdi
    dec rax
    jmp .rev_loop

  .done:
    ret
