;Verificar si un numero es positivo o negativo
section .data
    msj_positivo db "El numero es positivo", 0xA
    len_msj_positivo equ $-msj_positivo
    msj_negativo db "El numero es negativo", 0xA
    len_msj_negativo equ $-msj_negativo

section .text
    global _start

_start:
    mov eax, -20 ;numero para verificar si es positivo o negativo
    mov ebx, 0 ;numero a comparar para verificar si el numero dado es negativo
    cmp eax, ebx ;como internamente cmp hace un resta cuando el numero sea positivo no va a activar la bandera del signo. 
    ;pero cuando sea negativo se ejecuta la resta interna del cmp, se activara la bandera del signo.
    js esNegativo  ; entra si se activo la bandera del signo.
    jmp esPositivo  ;entra siempre  y cuando no entre al salto anterior. 

;Presentamos el mensaje es negativo.
esNegativo:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_negativo
    mov edx, len_msj_negativo
    int 80h
    jmp salir
    
;Presentamos el mensaje es positivo.
esPositivo:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_positivo
    mov edx, len_msj_positivo
    int 80h
    jmp salir

salir: 
    mov eax, 1
    int 80h


