;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
section .data
	mensaje1 db "Inicio ciclos", 10 , "Realizados POI", 10
	leng_mensaje1 equ $ -mensaje1
	mensaje3 db "Fin de ciclo", 10
	leng_mensaje3 equ $ -mensaje3
	mensaje4 db "Sandro", 10
	leng_mensaje4 equ $ -mensaje4
	%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80H	
	%endmacro
section .text
	global _start
_start:
	escribir mensaje1, leng_mensaje1
	mov ecx, 3
	ciclo:
		push ecx 
		escribir mensaje4, leng_mensaje4
		pop ecx
		loop ciclo
	escribir mensaje3, leng_mensaje3
	mov eax, 1
	mov ebx, 0
	int 80H