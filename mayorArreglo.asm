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
	mayor resb 2

	resultado resb 10
section .text
	global _start

_start:
	mov esi, arreglo
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
	jb leer
	mov ecx, 0

comparar: 
	mov al, [arreglo+ecx]
	cmp al, bl
		jb contador
	mov bl, al

contador:
	inc ecx
	cmp ecx, leng_arreglo
	jb comparar

salir:
	add bl, '0'
	mov [mayor], bl

	mov eax, 4
	mov ebx, 1
	mov ecx, mayor
	mov ebx, 2
	int 80H

	mov eax, 1
	int 80H