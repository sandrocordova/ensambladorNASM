;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	a db "Ingrese valor de a: ", 10
	leng_a equ $ -a
	b db "Ingrese valor de b: ", 10
	leng_b equ $ -b
	presentar db "La suma es: ", 10
	leng_presentar equ $ -presentar

section .bss
	dato_a resb 10
	dato_b resb 10
	suma resb 10

section .text
	global _start

_start:
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

	mov eax, 4
	mov ebx, 1
	mov ecx, b
	mov edx, leng_b
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_b
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar
	mov edx, leng_presentar
	int 80H

	mov eax, [dato_a]
	sub eax, '0'
	
	mov ebx, [dato_b]
	sub ebx, '0'
	add eax, ebx
	add eax,'0'
	mov [suma], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H
		