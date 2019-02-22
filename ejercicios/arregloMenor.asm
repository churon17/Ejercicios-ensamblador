section .data
        msg_inicio db  "Ingrese 5 numeros: ", 10
        len_inicio equ $ - msg_inicio
        msg_mayor db  "El menor es:", 10
        len_mayor equ $ - msg_mayor

        arreglo db 0, 0, 0, 0, 0
        len_arreglo equ $ - arreglo

section .bss
        dato resb 2

section .text
        global _start

_start:
        ;se define el arreglo en los registros indices
        mov esi, arreglo
        mov edi, 0

        ;Mostrar mensaje en el inicio
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_inicio
        mov edx, len_inicio
        int 80h


leer:
        ;Leer los datos para insertar en el arreglo
        mov eax, 3
        mov ebx, 2
        mov ecx, dato
        mov edx, 2
        int 80h

        mov al, [dato]
        sub al, '0'

        mov [esi], al

        inc edi         
        inc esi

        cmp edi, len_arreglo
        jb leer

        mov ecx, 0
        mov bl, [arreglo + ecx]

compare:
        mov al, [arreglo + ecx]
        cmp al, bl
        jg contador
        mov bl, al

contador:
        inc ecx
        cmp ecx, len_arreglo
        jb compare

imprimir:
        add bl, '0'
        mov [dato], bl
        ;Presentar mensaje "El mayor"
        mov eax, 4
        mov ebx, 1
        mov ecx, msg_mayor
        mov edx, len_mayor
        int 80h
        ;Presentar el mayor luego de la comparacion
        mov eax, 4
        mov ebx, 1
        mov ecx, dato
        mov edx, 1
        int 80h

;VOlver a la normalidaad el sistema
salir:
        mov eax, 1
        int 80h