; ---------------- Problem 1 ----------------
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.
; -------------------------------------------
bits 64

section .text
global main
extern printf


main:  
    mov     rsi, 0      ; sum
    mov     rcx, 999    ; max

    l1:
        ; first check divisibility by 3
        ; using the reminder of division by 3
        ; works here since all values are in natural numbers
        xor     rdx, rdx ; zero out rdx
        mov     rax, rcx
        mov     rdi, 3
        div     rdi
        cmp     rdx, 0
        jne     div5

        ; rax % 3 == 0, add to sum and jump to end
        add     rsi, rcx
        jmp     endl1

        div5:
        ; check divisibility by 5 if not divisible by 3
        xor     rdx, rdx ; zero out rdx
        mov     rax, rcx
        mov     rdi, 5
        div     rdi
        cmp     rdx, 0
        jne     endl1

        ; rax % 5 == 0, add to sum and jump to end
        add     rsi, rcx

        endl1:
            loop    l1

    ; print result
    lea     rax, [rel message]  ; loading message relative address to rax

    push    rbp         ; create stack frame
    mov     rdi, rax
    mov     rsi, rsi
    mov     rax, 0
    call    printf wrt ..plt

    pop     rbp

    mov     rax, 0  ; exit code 0
    ret


section .data
message     db  `%d\n`, 10, 0
