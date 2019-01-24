;Este ejercicio compara el mayor de dos numeros
section .data
    msj_mayor db 'El numero mayor es', 0xA
    len_msj_mayor equ $-msj_mayor

section .bss
    mayor resb 1

section .text
    global _start

_start:
    ;******************RESOLUCION DE EJERCICIO**************
    mov eax, 4 ;Numero 1 se lo guarda en eax.
    mov ebx, 5  ;Numero 2 se lo guarda en ebx
    cmp eax, ebx ;Compara el primer numero con el segundo 
    jg mayorDestino ;Si la comparacion anterior el destino es mayor al origen entra a este salto
    jmp mayorOrigen ;Entra siempre y cuando no haya entrado al anterior salto. 

mayorDestino:
    add eax, 30h ;Convertimos a cadena eax para poder moverlo a la variable mayor.
    mov [mayor], eax ;Pasamos a la variable mayor el valor de eax
    jmp presentarMayor

mayorOrigen:
    add ebx, 30h ;Convertimos a cadena ebx para poder moverlo a la variable mayor.
    mov [mayor], ebx ;Pasamos a la variable mayor el valor de eax
    jmp presentarMayor 
   
presentarMayor:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_mayor ;Presentamos el mensaje 'EL numero mayor es: '
    mov edx, len_msj_mayor
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, mayor ;Presentamos el numero mayor
    mov edx, 1
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h