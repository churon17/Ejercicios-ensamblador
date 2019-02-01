section .data
    msg_one db "Ingrese primer numero", 0xA
    len_msg_one equ $-msg_one
    msg_two db "Ingrese segundo numero", 0xA
    len_msg_two equ $-msg_two
    msg_third db "Ingrese tercer numero", 0xA
    len_msg_third equ $-msg_third
    msg_tercero db "La suma del primer y segundo numero es igual al tercero"
    len_msg_tercero equ $-msg_tercero
    msg_segundo db "La suma del primer y tercer numero es igual al segundo"
    len_msg_segundo equ $-msg_segundo
    msg_primero db "La suma del tercer y segundo numero es igual al primero"
    len_msg_primero equ $-msg_primero
    msg_ninguno db "Ninguno suma es igual al siguiente numero"
    len_msg_ninguno equ $-msg_ninguno

section .bss
    number_one resb 2
    number_two resb 2
    number_three resb 2
    
section .text
    global _start

_start:
    ;******Lectura y Escritura --- Number one******
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_one
    mov edx, len_msg_one
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, number_one
    mov edx, 2
    int 80h
    ;******Lectura y Escritura --- Number two******
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_two
    mov edx, len_msg_two
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, number_two
    mov edx, 2
    int 80h
    ;******Lectura y Escritura --- Number three******
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_third
    mov edx, len_msg_third
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, number_three
    mov edx, 2
    int 80h
    ;*****Resolucion de ejercicio
    mov ah, [number_one]
    sub ah, 30h
    mov bh, [number_two]
    sub bh, 30h
    mov ch, [number_three]
    sub ch, 30h
    add ah, bh
    cmp ah, ch 
    jz igualTercero
    sub ah, bh 
    add ah, ch 
    cmp ah, bh 
    jz igualSegundo 
    sub ah, ch 
    add bh, ch 
    cmp bh, ah 
    jz igualPrimero
    jmp ninguno 


igualSegundo:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_segundo
    mov edx, len_msg_segundo
    int 80h
    jmp salir

igualPrimero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_primero
    mov edx, len_msg_primero
    int 80h
    jmp salir

ninguno:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_ninguno
    mov edx, len_msg_ninguno
    int 80h
    jmp salir

igualTercero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_tercero
    mov edx, len_msg_tercero
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h

