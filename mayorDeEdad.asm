;Verificar si un dato dado es mayor a 18
;SI es mayor o igual a 18 presentamos mayor de edad
;SI es menor a 18 presentamos menor de edad
section .data
    msj_mayor db "Es mayor de edad"
    len_msj_mayor equ $-msj_mayor
    msj_menor db "Es menor de edad"
    len_msj_menor equ $-msj_menor


section .text
    global _start

_start:
    ;Verificar si un numero dado es mayor de edad. 
    mov eax, 0x12 ;EL valor de 18 en hexadecimal, en base a este numero vamos a comparar. 
    mov ebx, 0x12 ;EL valor dado va a ir almacenado en el registro ebx. 
    cmp ebx, eax ;Comparamos ambos registros. 
    jge higherAge   ;se activa este salto cuando el destino es mayor o igual al origen 
    jmp younger

;presentamos mensaje mayor de edad
higherAge:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_mayor
    mov edx, len_msj_mayor
    int 80h
    jmp salir
;Presentamos mensaje menor de edad
younger:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_menor
    mov edx, len_msj_menor
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h