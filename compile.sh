#!/bin/sh

nasm -f elf64 boot.s
nasm -f elf64 header.s 

~/opt/x86_64-pc-elf/bin/ld --nmagic --output=kernel.bin --script=linker.ld header.o boot.o
cp Kernel.bin isofiles/boot/

echo Done
