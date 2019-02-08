section .data
    asterisco db "*" 
    len_asterisco equ $-asterisco
    nueva_linea db 10, ''

section .text
    global _start

_start:
    mov ecx, 20 ;Es porque va a recorrer 20 veces hasta llegar al punto 1.
   

l1: ;Se ejecuta diractamente.
    push ecx  ; se envia la referencia de ecx a pila En pila tengo 20
    call imprimir_enter
    pop ebx
    mov ecx, ebx 
    push ebx 


l2: ;Se ejecuta diractamente.
    push ecx  ; se envia la referencia de ecx a pila En pila tengo 20
    call imprimir_asterisco
    pop ecx
    loop l2
    ;*************************
    pop ecx
    pop ebx 
    loop l1

    mov eax, 1 
    int 80h

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h
    ret ;Se lo utiliza cuando existe una funcion llamada call y es retornar al ultimo punto.

imprimir_enter:
    mov eax, 4
    mov ebx, 1
    mov ecx, nueva_linea
    mov edx, 1
    int 80h
    ret ;Se lo utiliza cuando existe una funcion llamada call y es retornar al ultimo punto.