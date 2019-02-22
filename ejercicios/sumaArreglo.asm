section .data
        msg_inicio db  "Ingrese 5 numeros: ", 10
        len_inicio equ $ - msg_inicio
        msg_suma db  "La suma de numeros es:", 10
        len_suma equ $ - msg_suma

        arreglo db 0, 0, 0, 0, 0
        len_arreglo equ $ - arreglo

section .bss
        dato resb 2

section .text
        global _start

_start:
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

        mov eax, 4
        mov ebx, 1
        mov ecx, msg_suma
        mov edx, len_suma
        int 80h

        mov ecx, 0
        mov al, 0
        mov bl, 0
       



imprimir:
        push ecx
        mov al, [arreglo + ecx]
        add al, '0'
        sub al, '0'
        add bl, al

        pop ecx
        inc ecx
        cmp ecx, len_arreglo
        jb imprimir

        add bl, '0'
        mov [dato], bl
        ;***************************mostrar mensaje***********************************
        mov eax, 4
        mov ebx, 1
        mov ecx, dato
        mov edx, 2
        int 80h

;VOlver a la normalidaad el sistema
salir:
        mov eax, 1
        int 80h