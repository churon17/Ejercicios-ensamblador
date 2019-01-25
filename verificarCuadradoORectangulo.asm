;En base a 2 valores dados respectivamente base y altura
;Verificar si es un rectangulo o un cuadrado
;Adicionalmente presentar su area y perimetro independietemente de lo que sea.

section .data
    msj_cuadrado  db "Es un cuadrado", 0xA
    len_msj_cuadrado equ $-msj_cuadrado
    msj_rectangulo db "Es un rectangulo", 0xA
    len_msj_rectangulo equ $-msj_rectangulo
    msj_perimetro db "El perimetro es:", 0xA
    len_msj_perimetro equ $-msj_perimetro
    msj_area db 0xA, "El area es:", 0xA
    len_msj_area equ $-msj_area

section .bss
    perimetro resb  1
    area resb 1

section .text
    global _start

_start:
    mov al, 2 ;base
    mov bl, 2 ;altura
    cmp al, bl
    jz esCuadrado
    jmp esRectangulo

esCuadrado:
    mul bl ;Multiplico bl * al para sacar el area, resultado se almacena en al
    add al, 30h ;convierte el resultado en al a caracter
    mov [area], al ; El valor de al lo pasamos a la variable area para su posterior presentacion
    mov al, bl ;Como es un cuadrado el valor de bl va a ser igual a al, previamente al por la multiplicacion cambio el valor, nuevamente le damos el valor de inicio.
    mov bl, 4 ;para sacar el perimetro necesitamos multiplicarlo por 4, le damos el valor de bl para posteriormente multiplicarlo por uno de sus lados
    mul bl ;multiplicamos el valor de al * bl y el resultado se almacena en al, siendo este el perimetro.
    add al, 30h  ;convertimos el resultado en caracter
    mov [perimetro], al ;el valor de al se va a perimetro para su posterior presentacion
    ;Presentacion del mennsaje de que es un cuadrado
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_cuadrado
    mov edx, len_msj_cuadrado
    int 80h
    jmp presentarDatos; siempre entra a este salto.

esRectangulo:
    mul bl ;Multiplico bl * al para sacar el area, resultado se almacena en al
    add al, 30h ;convierte el resultado en al a caracter
    mov [area], al ; El valor de al lo pasamos a la variable area para su posterior presentacion
    sub al, 30h; el valor de al que esta en caracter lo convierto en decimal.
    div bl ;dividimos al/bl para obtener nuevamente su valor original. 
    add al, bl ;sumamos la base y altura, almacenado en al y bl respectivamente y se almacena en al.
    mov bl, 2 ;cambiamos el valor de bl en 2, para poder calcular el perimetro.
    mul bl ;multiplicamos al * bl y de esa manera sacamos el perimetro 
    add al, 30h; convierte a caracter el valor almacenado en al 
    mov [perimetro], al ;el valor de al lo pasamos a la variable perimetro para su posterior presentacion
    ;Presentacion del mensaje de que es un rectangulo.
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_rectangulo
    mov edx, len_msj_rectangulo
    int 80h
    jmp presentarDatos ; siempre entra a este salto.

;Presenta los datos de area y perimetro con sus respectivos mensajes.
presentarDatos:
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_perimetro
    mov edx, len_msj_perimetro
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, perimetro
    mov edx, 1
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_area
    mov edx, len_msj_area
    int 80h
    mov eax, 4
    mov ebx, 1
    mov ecx, area
    mov edx, 1
    int 80h
    jmp salir

salir: 
    mov eax, 1
    int 80h