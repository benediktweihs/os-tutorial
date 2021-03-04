[org 0x7c00]
mov [BOOT_ENTRY], dl
mov bp, 0x9000 ; stack
mov sp, bp

mov bx, MSG_REAL_MODE
call print

;activate 32-bit protected mode
;

MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
len equ $ - MSG_REAL_MODE
BOOT_ENTRY db 0

%include "./boot_print_16real.asm"

times 510-($-$$) db 0
dw 0xaa55
