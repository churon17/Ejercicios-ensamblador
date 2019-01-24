;Ejercicio para verificar 
;Se ingresaran 3 numeros 2, 3, 4
;Si la suma de los dos primeros numeros es igual al tercero o
;SI la suma de el primer numero y el ultimo numero es igual al segundo numero
;Si la suma de los dos ultimos es igual al primero.
;Ejercicio para verificar 
;Se ingresaran 3 numeros 2, 3, 4
;Si la suma de los dos primeros numeros es igual al tercero o
;SI la suma de el primer numero y el ultimo numero es igual al segundo numero
;Si la suma de los dos ultimos es igual al primero.
section .data
    msj_tercero db 'La suma de los dos primeros numeros es igual al tercero', 0xA
    len_msj_tercero equ $-msj_tercero
    msj_segundo db 'La suma del primer y el tercer numero es igual al segundo', 0xA
    len_msj_segundo equ $-msj_segundo
    msj_primero db 'La suma del  segundo y tercer numero es igual al primero', 0xA
    len_msj_primero equ $-msj_primero
    msj_ninguno db 'Ninguna suma es igual a otro numero'
    len_msj_ninguno equ $-msj_ninguno

section .text
    global _start

_start:
    ;******************RESOLUCION DE EJERCICIO**************
    mov eax, 4
    mov ebx, 1
    ;mov ecx, 5 
    mov ecx, 7
    add eax, ebx ;Sumamos eax y ebx y el resultado se guarda en eax.
    cmp eax, ecx ;La suma anterior se compara con ecx. 
    je igualTercero ;Si la comparacion anterior es detino y fuente iguales entra a este salto.
    jmp continueCompare ; Si destino y fuente son diferente en la comparacion anterior entra a este salto.

igualTercero:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_tercero ;Presentamos el mensaje que la suma de los dos primeros es igual al tercer numero
    mov edx, len_msj_tercero
    int 80h
    jmp salir

continueCompare:
    mov eax, 4
    mov ecx, 1
    add eax, ecx ;Sumamos eax y ecx y el resultado se guarda en eax.
    ;mov ebx, 5
    mov ebx, 6 
    cmp eax, ebx ;La suma anterior se compara con ebx. 
    je igualMedio ;Si la comparacion anterior es detino y fuente iguales entra a este salto.
    jmp continueCompareLast ; Si destino y fuente son diferente en la comparacion anterior entra a este salto.
  
igualMedio:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_segundo ;Presentamos el mensaje que la suma del primer numero con el tercero es igual al segundo
    mov edx, len_msj_segundo
    int 80h
    jmp salir

continueCompareLast:
    mov ebx, 4
    mov ecx, 1
    add ebx, ecx ;Sumamos ebx y ecx y el resultado se guarda en ebx.
    mov eax, 5
    mov eax, 6
    cmp ebx, eax ;La suma anterior se compara con eax. 
    je igualFirst ;Si la comparacion anterior es detino y fuente iguales entra a este salto.
    jmp ninguno ; Si destino y fuente son diferente en la comparacion anterior entra a este salto.

igualFirst:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_primero ;Presentamos el mensaje que la suma del tercer numero con el segundo es igual al primero
    mov edx, len_msj_primero
    int 80h
    jmp salir  

ninguno:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_ninguno ;Presentamos el mensaje que ninguna suma es igual a otro numero.
    mov edx, len_msj_ninguno
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h