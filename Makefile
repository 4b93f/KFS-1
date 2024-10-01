default : kernel

header : header.s
	nasm -f elf64 header.s

boot : boot.s
	nasm -f elf64 boot.s

kernel : header boot
	~/opt/x86_64-pc-elf/bin/ld -n -o kernel.bin -T linker.ld header.o boot.o
	mkdir -p files/boot/grub
	cp grub.cfg files/boot/grub
	cp kernel.bin files/boot

clean :
	rm -rf *.o
	rm -rf kernel.bin
	rm -rf isofiles

