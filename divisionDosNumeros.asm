;Ejercicio para realizar la division de dos numeros
;tomando en cuenta que no es posible realizar una division para cero. 
section .data
    msj  db "La division de los dos numeros es", 0xA
    len_msj equ $-msj
    msj_error db "No es posible una division para cero"
    len_msj_error equ $-msj_error

section .bss
    resultado resb 2

section .text
    global _start

_start:
    mov al, 6 ;asignamos el valor de 6 al registro de 8 bits al
    mov bl, 2 ;asignamos el valor de 2 al registro de 8 bits bl
    mov ecx, 0 ;asignamos el valor de 0 al registro ecx para hacer una comparacion di el dividendo es 0 cancelar la division
    cmp ecx, ebx ;comparamos si bl que es parte de ebx, tiene el valor de 0. 
    jz noVale ; si es que se activa la bandera del 0 entra a este salto.
    jmp divide ; si es que no se activa el salto anterior se ejecuta este salto. 

;Mensaje para presentar en caso el dividendo almacenado en bl sea 0
noVale:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_error
    mov edx, len_msj_error
    int 80h
    jmp salir

 divide:
    div bl  ; divide al por bl y el resultado se almacena en bl
    add al, 30h  ; pasamos de decimal a ASCII para poder presentar
    mov [resultado], al ;el resultado que esta en al lo pasamos a la variabl resultado
    jmp presentar ;siempre entra a este salto 

;Presenta el mensaje de 'La divison de los dos numeros es' y el resultado de esa division.
presentar:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj
    mov edx, len_msj
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 80h
    jmp salir

salir:
    mov eax, 1
    int 80h

