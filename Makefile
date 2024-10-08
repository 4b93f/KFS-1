FLAGS = -fno-builtin -fno-exceptions -fno-stack-protector -nostdlib -nodefaultlibs

default : all

boot : boot.s
	nasm -f elf32 boot.s

build :
	nasm -f elf32 boot.s
	ld -m elf_i386 -T linker.ld -o kernel.bin boot.o
	mkdir -p files/boot/grub
	cp grub.cfg files/boot/grub
	cp kernel.bin files/boot

all : build
	grub-mkrescue -o out.iso files

clean :
	rm -rf *.o
	rm -rf kernel.bin
	rm -rf files

fclean : clean
	rm -rf *.iso

