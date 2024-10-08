MBALIGN  equ  1 << 0
MEMINFO  equ  1 << 1
MBFLAGS  equ  MBALIGN | MEMINFO
MAGIC    equ  0x1BADB002
CHECKSUM equ -(MAGIC + MBFLAGS)

section .multiboot_header
align 4
dd MAGIC
dd MBFLAGS
dd CHECKSUM

section .text
global _start:function (_start.end - _start)

_start:

	; print string
	mov word [0xb8000], 0x4034
	mov word [0xb8002], 0x4032
	hlt

	cli
.hang: hlt
	jmp .hang

.end:
