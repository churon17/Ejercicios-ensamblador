section .data
    msj_promedio db "El promedio de los 3 numeros es", 0xA
    len_msj_promedio equ $-msj_promedio

section .bss
    promedio resb 64
section .text
    global _start

_start:
    mov eax, 9 ; primer numero 
    mov ebx, 5 ; segundo numero
    mov ecx, 4 ; tercer numero
    add eax, ebx
    add eax, ecx 
    mov ebx, 3
    div ebx 
    add eax, 30h
    mov [promedio], eax
    jmp presentar

presentar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_promedio
    mov edx, len_msj_promedio
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, promedio
    mov edx, 64
    int 80h
    jmp salir

salir: 
    mov eax, 1
    int 80h