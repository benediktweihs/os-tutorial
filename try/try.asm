[org 0x7c00]

mov dx, es
;mov ah, 0x0e
;mov [data], es
;mov dx, 0x12fe
;add al, 1
;int 0x10
call print_hex

jmp $

%include "../05-bootsector-functions-strings/boot_sect_print_hex.asm"
%include "../05-bootsector-functions-strings/boot_sect_print.asm"

data:
	db 0

times 510 - ($ - $$) db 0
dw 0xaa55
