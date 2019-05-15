;[org 0x7c00]  if uncommented, first print works. However, 2 does not.
mov ah, 0x0e ; tty

mov al, [the_secret]
int 0x10 ; we already saw this doesn't work, right?

mov bx, 0x7c0 ; remember, the segment is automatically <<4 for you
;mov ds, 0x7c0  incorrect : cannot mov literals 
mov ds, bx  ; ds == Data segment
; WARNING: from now on all memory references will be offset by 'ds' implicitly
mov al, [the_secret]
int 0x10

mov al, [es:the_secret] ; es == Extra segment
int 0x10 ; doesn't look right... isn't 'es' currently 0x000?

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
;mov al, [es:0x24] 0x24 is the location of X
int 0x10


jmp $

the_secret:
    db "X"

times 510 - ($-$$) db 0
dw 0xaa55
