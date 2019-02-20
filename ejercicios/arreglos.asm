;Salto JB sucede cuando la bandera del carry esta activada.
section .data
    msg1 db "Ingrese 5 numeros y presione enter:", 10
    len_msg1 equ $-msg1
    arreglo db 0,0,0,0,0
    len_arreglo equ $-arreglo

section .bss
    dato resb 2


section  .text
    global _start

_start:
    ;******Se define el arrego en los registros indices*********
    mov esi, arreglo
    mov edi, 0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len_msg1
    int 80h


leer:
    mov eax, 3
    mov ebx, 2
    mov ecx, dato
    mov edx, 2
    int 80h

    mov al, [dato]
    sub al, '0' ;se convierte a decimal
    
    mov [esi], al
    inc edi
    add esi, 1
    cmp edi, len_arreglo
    jz siguiente
    jmp leer


siguiente:
    mov ecx, 0
    
imprimir:
    push ecx
    mov al, [arreglo + ecx] 
    add al, '0'
    mov [dato], al
    sub al, '0'

    mov eax, 4
    mov ebx, 1
    mov ecx, dato
    mov edx, 2
    int 80h   

    pop ecx
    inc ecx
    cmp ecx, len_arreglo
    jz salir
    jmp imprimir

salir:
    mov eax, 1
    int 80h




