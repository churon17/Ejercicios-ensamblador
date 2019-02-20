;Ejercicio de los Asteriscos invertidos.
;Resultado
;*
;**
;***
;****
;*****
;******
;*******
;********
section .data
    asterisco db "*" 
    len_asterisco equ $-asterisco
    nueva_linea db 10, ''

section .bss
    auxiliar resb 2
    auxiliar2 resb 2
    auxiliar3 resb 2

section .text
    global _start

_start:
    mov ecx, 20 
    mov ebx, 1
    mov [auxiliar], ecx
    mov [auxiliar2], ebx
    
l1:
    mov [auxiliar], ecx
    call imprimir_enter


l2:
    call imprimir_asterisco
    mov ecx, [auxiliar2]
    loop l2
    mov ecx, [auxiliar]
    loop l1
    ;mov [auxiliar2]



salir: 
    mov eax, 1
    int 80h

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h
  ;  mov ecx, [auxiliar2]
   ; inc ecx
   ; mov [auxiliar2], ecx
    ret ;Se lo utiliza cuando existe una funcion llamada call y es retornar al ultimo punto.

imprimir_enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80h
    ret ;Se lo utiliza cuando existe una funcion llamada call y es retornar al ultimo punto.


