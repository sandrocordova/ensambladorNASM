;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	mensaje db "------------------------------", 10,"Seleccione una opción ", 10, "1. Suma", 10, "2. Resta", 10,"3. Multiplicación", 10, "4. División", 10,"5. Cancelar",10, "------------------------------", 10
	leng_mensaje equ $ -mensaje
	lineas db 10, "------------------------------", 10
	leng_lineas equ $ -lineas
	a db "Ingrese valor de a: "
	leng_a equ $ -a
	b db "Ingrese valor de b: "
	leng_b equ $ -b
	uno db "1"
	presentar_suma db 10,"La suma es: "
	leng_presentar_suma equ $ -presentar_suma

section .bss
	dato_a resb 10
	dato_b resb 10
	cociente resb 10
	residuo resb 10
	suma resb 10
	resta resb 10
	multiplicacion resb 10

	dato_opcion resb 10
	dos resb 10
	tres resb 10

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

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_opcion
	mov edx, 2
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, a
	mov edx, leng_a
	int 80H

	mov eax, 3
	mov ebx, 2
	mov ecx, dato_a
	mov edx, 2;da la siguiente linea a leeer
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
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

;--------------------------------------------------------------------
	mov al, [dato_opcion]
	sub al, '0'
	cmp al, 1 ;suma
	jz _sumar
;-------------------------------------------------------------------
	cmp al, 2 ;resta
	jz _restar
;-------------------------------------------------------------------
	cmp al, 3 ;multiplicacion
	jz _multiplicar
;-------------------------------------------------------------------
	cmp al, 4 ;División
	jz _dividir
;-------------------------------------------------------------------

	jmp _salir

_dividir:

	mov al, [dato_a]
	sub al, '0'
	mov bl, [dato_b]
	sub bl, '0'
	
	div bl
	add al, '0'
	add ah, '0'

	mov [cociente], al
	mov [residuo], ah

	mov [presentar_suma+4], dword 'divi'; acepta hasta el 4 no sé por qué

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80H

	jmp _salir

_restar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	sub eax, ebx
	add eax,'0';convierte el numero a cadena
	mov [resta], eax

	mov[presentar_suma+4], dword 'rest'; acepta hasta el 4 no sé por qué

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80H

	jmp _salir

_sumar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	add eax, ebx
	add eax,'0';convierte el numero a cadena
	mov [suma], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80H

	jmp _salir

_multiplicar:
	mov eax, [dato_a]
	sub eax, '0'
	mov ebx, [dato_b]
	sub ebx, '0'
	mul ebx
	add eax,'0';convierte el numero a cadena
	mov [multiplicacion], eax

	mov[presentar_suma+4], dword 'Mult'

	mov eax, 4
	mov ebx, 1
	mov ecx, presentar_suma
	mov edx, leng_presentar_suma
	int 80H

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80H

	jmp _salir

_salir:
	mov eax, 4
	mov ebx, 1
	mov ecx, lineas
	mov edx, leng_lineas
	int 80H

	mov eax, 1
	mov ebx, 0
	int 80H