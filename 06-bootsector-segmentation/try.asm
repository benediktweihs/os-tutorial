[org 0x7c00]
mov ah, 0x0e ; output tty
mov al, lenMes
int 0x10

mov al, [text]

begin:
  cmp al, lenMes
  je end
  jmp print
  add al, 0x1

print:
  int 0x10

end:

jmp $

text:
  db "Hallo welt"

lenMes equ $ - text

times 510 - ($ - $$) db 0
dw 0xaa55
