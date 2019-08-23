;UNL
;Sandro Michael Córdova Carrión
;6to "B"
;Lunes 23 de agosto del 2019
%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1 
	mov edx,%2
	int 80H	
%endmacro
%macro leer 2
    mov eax,3
    mov ebx,0
    mov ecx,%1 
    mov edx,%2
    int 80H 
%endmacro

section .bss
	text resb 30
	idarchivo resd 1

section .data
	msj1 db "ESCRIBIR EL ARCHIVO",10
	lenMsg1 equ $- msj1

	path db "/home/jacc/Documentos/ensamblador/clases/archivob23.txt",0

section .text
    global _start    

_start:
	mov eax,8		
	mov ebx,path	
	mov ecx,2
	mov edx,200h
	int 80h

	test eax,eax 
	jz salir

	mov dword [idarchivo],eax	
	imprimir msj1,lenMsg1

	mov eax,3
	mov ebx,2
	mov ecx,text
	mov edx,15
	int 80H

	mov eax,4
	mov ebx,[idarchivo]
	mov ecx,text
	mov edx,15
	int 80H	

salir:
	mov eax, 1
	int 80H
