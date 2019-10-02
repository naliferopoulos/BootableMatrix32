build:
	nasm intro.s -f bin -o intro.bin

clean:
	rm intro.bin

run:
	qemu-system-i386 -fda intro.bin
