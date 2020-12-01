default rel

section .data
msg: db "Hello, World!", 0

section .text
global hello
hello:
    lea rax, [msg]
    ret
