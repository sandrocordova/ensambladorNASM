;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	mensaje db "Inicio......"
	leng_mensaje equ $ -mensaje
	lineas db 10, "------------------------------", 10
	leng_lineas equ $ -lineas
	a db "Ingrese valor de a: "
	leng_a equ $ -a
	b db "Ingrese valor de b: "
	leng_b equ $ -b
	presentar_suma db 10,"La suma es: "
	leng_presentar_suma equ $ -presentar_suma

section .bss
	dato_a resb 10
	dato_b resb 10
	resultado resb 10
section .text
	global _start
	global _dividir
	global _restar
	global _sumar
	global _multiplicar
	global _salir

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, leng_mensaje
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, a
	mov edx, leng_a
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_a
	mov edx, 2
	int 80H

	mov eax, [dato_a]
	push eax

	mov eax, 2
	add eax, '0'
	mov [resultado], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

	pop eax
	mov [resultado], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H




