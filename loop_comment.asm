section .bss
num resb 1

section .text
		global _start

_start:
		
	mov ecx,10		;Declara que ecx tendrà un valor de 10
	mov eax, '1'	;Inicializa eax con el valor de 1 tipo string

l1:
mov [num], eax		;Guarda en la variable num el valor que tiene eax (Se aplica direccionamiento indirecto)
mov eax, 4			;Indicamos que va a llamar a una instruccion de escritura
mov ebx, 1
push ecx			;Envia al segmento de pila el valor ecx (valor y referencia)

mov ecx, num		;Imprime el valor de num
mov edx, 1		    ;El tamanio del valor de num
int 0x80

mov eax, [num]		;Mueve el valor de num a eax
sub eax, '0'		;Transforma a decimal el valor de eax
inc eax				;Incrementa el valor de eax
add eax, '0'		;Transforma a string el decimal almacenado en eax
pop ecx				;Extrae de la pila el valor y lo asigna a ecx
loop l1				;Ingresa nuevamente al bloque de codigo de l1 para repetirlo y decrementa en uno al registro ecx hasta que llegue a 1.

;Sale del programa
mov eax,1 ; Para retornar a la normalidad del sistema
int 0x80
