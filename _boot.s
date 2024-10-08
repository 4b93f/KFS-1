bits 32
global _start

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

_start:
        mov word [0xb8000], 0x0734 ; '4' (ASCII 0x34) with attribute 0x07
        mov word [0xb8002], 0x0732 ; '2' (ASCII 0x32) with attribute 0x07
	cli
	hlt
loop:
	jmp loop 

section .text

section .bss
resb 8192                       ; 8KB for stack
stack_space:

