section .data
    msj db "*******" , 10
    len_msj equ $-msj


section .text
    global _start

_start:
    mov ecx, 20 ;Es porque va a recorrer 20 veces hasta llegar al punto 1.
l1: ;Se ejecuta diractamente.
    mov eax, 4
    mov ebx, 1
    push ecx  ; se envia la referencia de ecx a pila En pila tengo 20
    mov ecx, msj
    mov edx, len_msj
    int 80h
    pop ecx
    loop l1 ; se decrementa cx en 1. 
    mov eax, 1
    int 80h

