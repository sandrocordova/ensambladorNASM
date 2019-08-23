;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	%assign signos "*"
	mensaje db "Ejemplo Trabajo Final",signos, 10
	leng equ $-mensaje

section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, leng
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H
