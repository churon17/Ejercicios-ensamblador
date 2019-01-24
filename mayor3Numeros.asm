;Se ingresan 3 numeros estaticamente 
;Se compara entre los 3
;AL final se presenta cual es el mayor de los 3. 
section .data
    msj_mayor db "EL mayor es", 0xA
    len_msj_mayor equ $-msj_mayor 

section .bss
    mayor resb 1 ;variable utilizada para guardar el valor del mayor e imprimirlo.

section .text
    global _start

_start:
    mov eax, 9  ;asignamos el valor de 9 en eax
    mov ebx, 5 ;asignamos el valor de 9 en eax
    cmp eax, ebx   ;comparamos ambos registros eax, ebx.  
    jg mayorEax     ;cuando en la comparacion previa destino es mayor al origen entra a este salto.
    jmp mayorEbx    ;si es que no entra al salto anterior entra si o si a este salto.

mayorEax:
    add eax, 30h ; convertimos el dato que hay en eax de decimal a ASCII y se mantiene en eax.
    mov [mayor], eax ;el dato que convertimos en ASCII se pasa a la variable mayor, para la posterior comparacion
    jmp continueCompare ; entra siempre a este salto. 

mayorEbx:
    add ebx, 30h ; convertimos el dato que hay en ebx de decimal a ASCII y se mantiene en ebx.
    mov [mayor], ebx ;el dato que convertimos en ASCII se pasa a la variable mayor, para la posterior comparacion
    jmp continueCompare ; entra siempre a este salto. 

 continueCompare:
    mov ecx, 6 ; asignamos el valor e 6 en el registro ecx
    mov eax, [mayor] ;el valor que tenemos almacenada en mayor lo pasamos al registro eax.
    sub eax, 30h    ;pasamos de ASCII a decimal el valor de eax y se mantiene en eax..
    cmp eax, ecx ;comparamos ambos registros eax, ecx.  
    jg mayorIsEax  ;cuando en la comparacion previa destino es mayor al origen entra a este salto.
    jmp mayorIsEcx ;si es que no entra al salto anterior entra si o si a este salto.

mayorIsEax:
    add eax, 30h ; convertimos el dato que hay en eax de decimal a ASCII y se mantiene en eax.
    mov [mayor], eax ;el dato que convertimos en ASCII almacenada en eax se pasa a la variable mayor, para presentar el mayor.
    jmp presentHigh ;entra siempre a este salto. 

mayorIsEcx:
    add ecx, 30h ; convertimos el dato que hay en ecx de decimal a ASCII y se mantiene en eax.
    mov [mayor], ecx ;el dato que convertimos en ASCII almacenado en ecx se pasa a la variable mayor, para presentar el mayor.
    jmp presentHigh ;entra siempre a este salto. 

;Escritura de datos.
presentHigh:
    mov eax, 4  ;llamamos a la rutina de escritura.
    mov ebx, 1
    mov ecx, msj_mayor ;presentamos el mensaje "EL mayor es: ".
    mov edx, len_msj_mayor ;el tamanio del mensaje.
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, mayor ; presentamos la variable mayor, que contiene el numero mayor. 
    mov edx, 1
    int 80h
    jmp salir

salir: 
    mov eax, 1
    int 80h



