section .data 
    msg_titulo db 10,"Calculadora Basica", 10
    len_msg_titulo equ $-msg_titulo
    msg_number_one db "Ingrese primer numero", 0xA
    len_msg_number_one equ $-msg_number_one
    msg_number_two db "Ingrese segundo numero", 0xA
    len_msg_number_two equ $-msg_number_two
    msg_option db 10, "Ingrese operacion", 10, "1.Suma", 10, "2.Resta", 10,"3.Multiplicacion" ,10, "4.Division", 10, "5.Salir", 10
    len_msg_option equ $-msg_option
    msg_suma db "La Suma es:", 10
    len_msg_suma equ $-msg_suma
    msg_resta db "La resta es", 10
    len_msg_resta equ $-msg_resta
    msg_multiplicacion db "La multiplicacion es", 10
    len_msg_multiplicacion equ $-msg_multiplicacion
    msg_division db "La  division es:", 10
    len_msg_division equ $-msg_division

section .bss
    number_one resb 2
    number_two resb 2
    result resb 2
    opcion resb 2

section .text
    global _start

_start: 
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_titulo
    mov edx,len_msg_titulo
    int 80h
    ;***Ingreso por teclado***
    ;****NUMERO 1*****
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_number_one
    mov edx, len_msg_number_one
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, number_one
    mov edx, 2
    int 80h ;Toma el control del Kernel de Linux
    ;***NUMERO 2******
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_number_two
    mov edx, len_msg_number_two
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, number_two
    mov edx, 2
    int 80h
    ;***Opcion elegida****
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_option
    mov edx, len_msg_option
    int 80h
    mov eax, 3
    mov ebx, 2
    mov ecx, opcion
    mov edx, 2
    int 80h
    ;***Cuerpo del programa****
    mov ah, [opcion]
    sub ah, '0'
    cmp ah, 1
    je suma
    cmp ah, 2
    je resta
    cmp ah, 3
    je multi
    cmp ah, 4
    je division
    cmp ah, 5
    je salir

suma:
    mov al, [number_one]
    sub al, 30h
    mov bl, [number_two]
    sub bl, 30h
    add al, bl 
    add al, 30h
    mov [result], al
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_suma
    mov edx, len_msg_suma
    int 80h
    jmp presentResult

resta:
    mov al, [number_one]
    sub al, 30h
    mov bl, [number_two]
    sub bl, 30h
    sub al, bl 
    add al, 30h
    mov [result], al
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_resta
    mov edx, len_msg_resta
    int 80h
    jmp presentResult

multi:
    mov al, [number_one]
    sub al, 30h
    mov bl, [number_two]
    sub bl, 30h
    mul bl 
    add al, 30h
    mov [result], al
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_multiplicacion
    mov edx, len_msg_multiplicacion
    int 80h
    jmp presentResult

division:
    mov al, [number_one]
    sub al, 30h
    mov bl, [number_two]
    sub bl, 30h
    mov dx, 0
    mov ah, 0
    div bl 
    add al, 30h
    mov [result], al
    mov eax, 4 
    mov ebx, 1
    mov ecx, msg_division
    mov edx, len_msg_division
    int 80h
    jmp presentResult

presentResult:
    mov eax, 4 
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 80h
    jmp salir
salir:
    mov eax, 1
    int 80h
    

