bits 32
global start

section .multiboot_header
header_start:
        dd 0xe85250d6 ; magic number
        dd 0          ; protected mode code
        dd header_end - header_start ; header length
        dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

        dw 0    ; type
        dw 0    ; flags
        dd 8    ; size
header_end:

start:
        mov word [0xb8000], 0x0248 ; H
        mov word [0xb8002], 0x0265 ; e
        mov word [0xb8004], 0x026c ; l
        mov word [0xb8006], 0x026c ; l
        mov word [0xb8008], 0x026f ; o
        mov word [0xb800a], 0x022c ; ,
        mov word [0xb800c], 0x0220 ;
        mov word [0xb800e], 0x0277 ; w
        mov word [0xb8010], 0x026f ; o
        mov word [0xb8012], 0x0272 ; r
        mov word [0xb8014], 0x026c ; l
        mov word [0xb8016], 0x0264 ; d
        mov word [0xb8018], 0x0221 ; !
        hlt ; halt the CPU

section .text

section .bss
resb 8192			; 8KB for stack
stack_space:
