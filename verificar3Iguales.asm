;Para verficar si los 3 numeros dados son iguales
;Se presenta un mensaje positivo si los 3 numeros son iguales
;Se presenta un mensaje negativo si uno de ellos es diferente

section .data
    msj_yes db "Los 3 numeros son iguales", 0xA
    len_msj_yes equ $-msj_yes
    msj_not db "Los 3 numeros no son iguales", 0xA
    len_msj_not equ $-msj_not
    
section .text
    global _start

_start:
    mov eax, 4 ;el valor de 4 queda almacenado en el registro eax
    mov ebx, 4 ;el valor de 4 queda almacenado en el registro ebx
    cmp eax, ebx ;comparamos ambos registros eax, ebx
    jz verifyLastEqual ;Si es que destino y origin son iguales en la previa comparacion entra a este salto. 
    jmp notEquals ;siempre que no ingrese  al salto anterior va a ingresar a este salto. 

verifyLastEqual:
    mov ecx, 4 ;el valor de 4 queda almacenado en el registro ecx
    cmp eax, ecx ;comparamos ambos registros eax, ebx
    jz  equals ;Si es que destino y origin son iguales en la previa comparacion entra a este salto.
    jmp notEquals ;siempre que no ingrese al sallto anterior va a ingresar a este salto. 

;Presentamos el mensaje que no son iguales.
notEquals:
    mov eax, 4 ;invoca a la subrutina de escritura.
    mov ebx, 1
    mov ecx, msj_not 
    mov edx, len_msj_not
    int 80h
    jmp salir
;Presentamos el mensaje qu son iguales.
equals:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_yes
    mov edx, len_msj_yes
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h