section .text
	global _start

section .bss
	num resb 1
section .data
	msgUsr db 'Input: '
	lenMsgUsr equ $-msgUsr
	msgAnsw db 'Your message: '
	lenAnsw equ $-msgAnsw

_start:
	mov edx, lenMsgUsr		;register edx must contain length
	mov eax, 4			;sys_call 04 corresponds to sys_write()
	mov ecx, msgUsr			;load message in correct register
	mov ebx, 1			;stdout!
	int 0x80			;call kernel

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 1
	int 0x80

	mov edx, lenAnsw		;register edx must contain length
	mov eax, 4			;sys_call 04 corresponds to sys_write()
	mov ecx, msgAnsw		;load message in correct register
	mov ebx, 1			;stdout!
	int 0x80			;call kernel

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
