[org 0x7c00]
mov bp, 0x9000
mov sp, bp

;mov bx, 0x9000 ; address to load data from disk
;mov dh, 2 ; read two sectors.
;call disk_load

mov bx, MES1
call print
call print_nl

mov bx, MES2
call print
call print_nl

;enable 32 bit mode
call switch_to_pm

jmp $

%include "print.asm"
;%include "boot_sect_disk.asm"
%include "32bit-switch.asm"
%include "32bit-gdt.asm"
%include "32bit-print.asm"

[bits 32]
BEGIN_PM: ; after the switch we will get here
    mov ebx, MSG_PROT_MODE
    call clear_screen
    call print_string_pm ; Note that this will be written at the top left corner
    jmp $


MES1: db "Started in 16-bit mode.", 0
MES2: db "Enabling 32-bit mode...", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0


times 510-($-$$) db 0
dw 0xaa55

;times 512 db 0xdada
;times 512 db 0xbfbf