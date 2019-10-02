; DISCLAIMER - The intro code IS NOT MINE!
; The original author of the intro is 'tap'
; The intro was submitted to the 0a000h 
; competition in 2002 as 'matrix32' and
; was a 32byte matrix rain effect which
; was awarded the 2nd place. I liked the
; intro, and all I did was merely modify it
; to be bootable code. I do not claim 
; ownership for it in any way.

org 0x7C00	; Start high, above the stack.
bits 16		; Well, duh.

mov ax, 0	; Set up segments
mov ds, ax
mov es, ax
mov ss, ax

mov sp, 0x7C00	; Set up a stack

xor bx,bx

; Ported Demo Code
; NOT MINE!

mov al, 03h	; Select video mode
int 10h

push word 0B800h
pop ds

again:
 and bh, 3Fh

 rdtsc			; Fetch clock
 test ax, 1111010111110000b
 jz l1
 mov ax, [bx]
 shl byte [bx],1
 jz l2

l1:
 mov [bx + 160], ax

l2:
 dec bx
 dec bx
 jmp short again

; End of Ported Demo Code

db 'M'
db 'a'
db 't'
db 'r'
db 'i'
db 'x'
db '3'
db '2'
db ' '
db 'b'
db 'y'
db ' '
db 't'
db 'a'
db 'p'
db '!'
db ' '
db 'P'
db 'o'
db 'r'
db 't'
db 'e'
db 'd'
db ' '
db 'b'
db 'y'
db ' '
db 'I'
db 'n'
db 'f'
db 'i'
db 'd'
db 'e'
db 'l'
db 'C'
db 'a'
db 's'
db 't'
db 'r'
db 'o'

times 510-($-$$) db 0h 	; Pad up to 510 bytes with zeroes.
dw 0AA55h 			; Define the sector as bootable.
