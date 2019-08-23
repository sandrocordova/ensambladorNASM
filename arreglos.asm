;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	lineas db "------------------------------", 10
	leng_lineas equ $ -lineas

	mensaje db "Ingrese 5 números y presione enter", 10
	leng_mensaje equ $ -mensaje

	salto db "",10
	leng_salto equ $ -salto

	arreglo db 0,0,0,0,0
	leng_arreglo equ $ -arreglo

section .bss
	dato resb 2
	resultado resb 10
section .text
	global _start

_start:
	;Fuente
	mov esi, arreglo
	;Destino
	mov edi, 0


	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov ebx, leng_mensaje
	int 80H


leer:
	mov eax, 3
	mov ebx, 2
	mov ecx, resultado
	mov edx, 2
	int 80H

	mov al, [resultado]
	sub al, '0'

	mov [esi], al
	inc esi
	inc edi

	cmp edi, leng_arreglo
		;Mientras sea menor
		jb leer

	mov ecx, 0
	jmp imprimir

imprimir:
	push ecx
	mov al, [arreglo+ecx]
	add al, '0'
	mov [resultado], al

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov ebx, 2
	int 80H

	pop ecx
	inc ecx
	cmp ecx, leng_arreglo
		;Mientras sea menor
		jb imprimir

salir:
mov eax, 1
int 80H