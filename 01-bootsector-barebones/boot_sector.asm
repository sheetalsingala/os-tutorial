; Infinite loop (e9 fd ff)
loop:
    jmp loop 

; Fill with 510 zeros minus the size of the previous code
; A Master Boot Record is made up of 512 bytes, the last two bytes must be 0x55 0xAA. 
; That's 510 bytes left, the partition table entries is 16 bytes, at the most 4 partition table entries, which is 64 bytes. 
; What's left is 446 bytes of assembler code. Usually the first few bytes consists of a boot identifier record, 
; describing the boot loader's disk data, such as the identifier, system id, to name but a few, 
; then the BIOS expects the boot code at 0x000:0x07C00, then it relocates itself lower down in the memory segment.

; To compile: nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin
; To run :  qemu boot_sect_simple.bin
times 510-($-$$) db 0
; Magic number
dw 0xaa55 

; You will see a window open which says "Booting from Hard Disk..." and nothing else.