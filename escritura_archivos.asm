;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	mensaje1 db "escribió el mensaje", 10
	leng_mensaje1 equ $ -mensaje1
	path db "/home/sandro/Nasm/MensajeAImprimir222.txt", 0
	
section .bss
	texto resb 20
	idarchivo resd 1

section .text
	global _start

_start:
	mov eax, 8	
	mov ebx, path 	
	mov ecx, 1		
	mov edx, 200H		
	int 80H

	test eax, eax 
	jz salir

	mov dword [idarchivo], eax
	mov eax, 3
	mov ebx, 2
	mov ecx, texto
	mov edx, 15
	int 80H

	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 15
	int 80H

	mov eax, 6		
	mov ebx, [idarchivo]
	mov ecx, 0 
	mov edx, 0
	int 80H

salir:
	mov eax, 1
	mov ebx, 0
	int 80H