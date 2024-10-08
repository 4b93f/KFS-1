FLAGS = -fno-builtin -fno-exceptions -fno-stack-protector -nostdlib -nodefaultlibs

default : kernel_bin

boot : boot.s
	nasm -f elf32 boot.s

kernel : kernel.c
	gcc -m32 -ffreestanding ${FLAGS} kernel.c -o kernel.o 

___kernel_bin : boot kernel
	ld -m elf_i386 -T linker.ld -o kernel.bin boot.o kernel.o
	mkdir -p files/boot/grub
	cp grub.cfg files/boot/grub
	cp kernel.bin files/boot
build :
	nasm -f elf32 _boot.s
	ld -m elf_i386 -T linker.ld -o kernel.bin _boot.o
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

