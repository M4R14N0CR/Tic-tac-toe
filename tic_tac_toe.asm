%include 'macros.asm'

section .data

codigo db 0x1b,"[36;40m"
lencodigo equ $-codigo

codigo1 db 0x1b,"[34;40m"
lencodigo1 equ $-codigo1

codigo2 db 0x1b,"[32;40m"
lencodigo2 equ $-codigo2

codigo3 db 0x1b,"[31;40m"
lencodigo3 equ $-codigo3

codigo4 db 0x1b,"[33;40m"
lencodigo4 equ $-codigo4

codigo5 db 0x1b,"[35;40m"
lencodigo5 equ $-codigo5
;------------------------------------------------------------------------
fila db   "   0   1   2",10,13
len_fila equ $-fila

fila_0 db "0 [_] [_] [_]",10,13
len_fila_0 equ $-fila_0

fila_1 db "1 [_] [_] [_]",10,13
len_fila_1 equ $-fila_1

fila_2 db "2 [_] [_] [_]",10,13
len_fila_2 equ $-fila_2

msg1 db "Jugador 1: ingrese las coordenadas:"
len_msg1 equ $-msg1

msg2 db "Jugador 2: ingrese las coordenadas:"
len_msg2 equ $-msg2

msg4 db 10,13,"Jugador1: x",10,13
len_msg4 equ $-msg4

msg5 db "Jugador2: o",10,13
len_msg5 equ $-msg5

msg6 db "Tecla ESC",10,10,13
len_msg6 equ $-msg6

msg7 db "-------------------------------------------",10,13
len_msg7 equ $-msg7

msg8 db 10,13,"Jugador1 gana!!!",10,10,13,7
len_msg8 equ $-msg8

msg9 db 10,13,"Jugador2 gana!!!",10,10,13,7
len_msg9 equ $-msg9

msg10 db 10,13,"Es empate!!!",10,13,7
len_msg10 equ $-msg10

msg11 db 10,13,"Bienvenido al Juego de ",10,13
len_msg11 equ $-msg11

msg12 db "Seleccione una opcion",10,13
len_msg12 equ $-msg12

msg13 db "1. Iniciar Juego",10,13
len_msg13 equ $-msg13

msg14 db "2. Salir",10,13
len_msg14 equ $-msg14

msg15 db " _____   ___ _____ _____",10,13
len_msg15 equ $-msg15

msg16 db "|  __ \ / _ \_   _|  _  |",10,13
len_msg16 equ $-msg16

msg17 db "| |  \// /_\ \| | | | | |",10,13
len_msg17 equ $-msg17

msg18 db "| | __ |  _  || | | | | |",10,13
len_msg18 equ $-msg18

msg19 db "| |_\ \| | | || | \ \_/ /",10,13
len_msg19 equ $-msg19

msg20 db " \____/\_| |_/\_/  \___/",10,10,13
len_msg20 equ $-msg20


section .bss
num resb 2
num0 resb 2
num1 resb 2
num2 resb 2
num3 resb 2
num4 resb 2
num5 resb 2
num6 resb 2
num7 resb 2
num8 resb 3

variable00 resb 1
variable01 resb 1
variable02 resb 1
variable10 resb 1
variable11 resb 1
variable12 resb 1
variable20 resb 1
variable21 resb 1
variable22 resb 1

section .text
	global _start
	
_start:

jmp inicio1

inicio:
imprime codigo4,lencodigo4
imprime msg10,len_msg10


;Objetivo del procedimiento (de la linea 130 hasta la linea 195):
; En este caso el programa lo que hara es que si alguna posicion tiene una "x" o un "o" los cambiara automaticamente por un "_", esto es para cuando se oprime el boton de esc, de esta forma podremos iniciar el juego desde 0.

;-------------------------recorrido_fila_1--------------------------------

mov esi,fila_0

add esi,3
mov byte[esi],"_"
;--------------------------------------------------------------------------

mov esi,fila_0

add esi,7
mov byte[esi],"_"

;--------------------------------------------------------------------------

mov esi,fila_0

add esi,11
mov byte[esi],"_"

;-------------------------recorrido_fila_1--------------------------------

mov esi,fila_1

add esi,3
mov byte[esi],"_"
;--------------------------------------------------------------------------


mov esi,fila_1

add esi,7
mov byte[esi],"_"


;--------------------------------------------------------------------------

mov esi,fila_1

add esi,11
mov byte[esi],"_"

;-------------------------recorrido_fila_2--------------------------------

mov esi,fila_2

add esi,3
mov byte[esi],"_"


;--------------------------------------------------------------------------

mov esi,fila_2

add esi,7
mov byte[esi],"_"


;--------------------------------------------------------------------------

mov esi,fila_2

add esi,11
mov byte[esi],"_"

;--------------------------------------------------------------------------


; Objetivo del procedimiento (de la linea 202 hasta la linea 245):
; En este caso primeramente se colocará un 0 en todas las variables asociadas a una posición de la matriz, esto para las validaciones que se haras más adelante. Luego se impimiran los mensajes corresponientes y se pedirá al usuario que ingrese 1 para iniciar el juego o 2 para salir (En caso de que el usuario ingrese un número difernte a 1 y 2 se imprimira todo de nuevo hasta que se ingrese una opción valida)


inicio1:

mov dh,0
mov[variable00],dh
mov[variable01],dh
mov[variable02],dh
mov[variable10],dh
mov[variable11],dh
mov[variable12],dh
mov[variable20],dh
mov[variable21],dh
mov[variable22],dh



imprime codigo,lencodigo 

imprime msg11,len_msg11
imprime codigo5,lencodigo5
imprime msg15,len_msg15
imprime msg16,len_msg16
imprime msg17,len_msg17
imprime msg18,len_msg18
imprime msg19,len_msg19
imprime msg20,len_msg20


imprime codigo,lencodigo

imprime msg12,len_msg12
imprime msg13,len_msg13
imprime msg14,len_msg14

recibe num,2

mov al,[num]

cmp al,"1"
je Posicion_1x

cmp al,"2"
je salir

jmp inicio1

;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 1 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 1 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 1 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 251 hasta la linea 470):
; En este caso primero se imprimira en pantalla los mensajes correspondiente junto con la matriz, posteriormente se pedira al jugador1 que ingrese una coordenada en la que desee colocar una "x", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltara a la sección de codigo que colocará un 1 en en la variable correspondiente y tambien colocara una "x" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_1x:

imprime codigo1,lencodigo1
imprime msg7,len_msg7

imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2

imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6
imprime msg1,len_msg1

recibe num0,2

mov ah,[num0]
mov cx,[num0]

cmp ah, 27
je inicio

;-------------------------------------------------------------------------
cmp cx, "00"
je suma1x

cmp cx, "01"
je suma5x

cmp cx, "02"
je suma9x
;--------------------------------------------------------------------------
cmp cx, "10"
je suma2_1x

cmp cx, "11"
je suma2_5x

cmp cx, "12"
je suma2_9x

;--------------------------------------------------------------------------
cmp cx, "20"
je suma3_1x

cmp cx, "21"
je suma3_5x

cmp cx, "22"
je suma3_9x

jmp Posicion_1x
;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

suma1x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable00],dl
;*************************************************************************

mov esi,fila_0

add esi,3
mov byte[esi],"x"

jmp imprimir_1x
;--------------------------------------------------------------------------

suma5x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable01],dl
;*************************************************************************

mov esi,fila_0

add esi,7
mov byte[esi],"x"
jmp imprimir_1x

;--------------------------------------------------------------------------

suma9x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable02],dl
;*************************************************************************

mov esi,fila_0

add esi,11
mov byte[esi],"x"
jmp imprimir_1x


;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------


suma2_1x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable10],dl
;*************************************************************************

mov esi,fila_1

add esi,3
mov byte[esi],"x"

jmp imprimir_1x
;--------------------------------------------------------------------------

suma2_5x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable11],dl
;*************************************************************************

mov esi,fila_1

add esi,7
mov byte[esi],"x"
jmp imprimir_1x

;--------------------------------------------------------------------------

suma2_9x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable12],dl
;*************************************************************************

mov esi,fila_1

add esi,11
mov byte[esi],"x"
jmp imprimir_1x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

suma3_1x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable20],dl
;*************************************************************************

mov esi,fila_2

add esi,3
mov byte[esi],"x"

jmp imprimir_1x
;--------------------------------------------------------------------------

suma3_5x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable21],dl
;*************************************************************************

mov esi,fila_2

add esi,7
mov byte[esi],"x"
jmp imprimir_1x

;--------------------------------------------------------------------------

suma3_9x:

;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable22],dl
;*************************************************************************

mov esi,fila_2

add esi,11
mov byte[esi],"x"
jmp imprimir_1x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_1x:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6


;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 2 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 2 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 2 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 480 hasta la linea 704):
; En este caso se pedira al jugador2 que ingrese una coordenada en la que desee colocar un "o", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 2 en en la variable correspondiente y tambien colocara un "o" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_2o:
recibe num1,2

imprime msg2,len_msg2
recibe num1,2

mov ah,[num1]
mov cx,[num1]
cmp ah, 27
je inicio

;-------------------------------------------------------------------------
cmp cx, "00"
je suma1o

cmp cx, "01"
je suma5o

cmp cx, "02"
je suma9o
;--------------------------------------------------------------------------
cmp cx, "10"
je suma2_1o

cmp cx, "11"
je suma2_5o

cmp cx, "12"
je suma2_9o

;--------------------------------------------------------------------------
cmp cx, "20"
je suma3_1o

cmp cx, "21"
je suma3_5o

cmp cx, "22"
je suma3_9o

jmp Posicion_2o

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

suma1o:

mov al, [variable00]
cmp al,0
jne Posicion_2o

;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable00],dl
;*************************************************************************

mov esi,fila_0

add esi,3
mov byte[esi],"o"

jmp imprimir_2o
;--------------------------------------------------------------------------

suma5o:
mov al, [variable01]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable01],dl
;*************************************************************************

mov esi,fila_0

add esi,7
mov byte[esi],"o"
jmp imprimir_2o

;--------------------------------------------------------------------------

suma9o:
mov al, [variable02]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable02],dl
;*************************************************************************

mov esi,fila_0

add esi,11
mov byte[esi],"o"
jmp imprimir_2o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma2_1o:
mov al, [variable10]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable10],dl
;*************************************************************************

mov esi,fila_1

add esi,3
mov byte[esi],"o"

jmp imprimir_2o
;--------------------------------------------------------------------------

suma2_5o:
mov al, [variable11]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable11],dl
;*************************************************************************

mov esi,fila_1

add esi,7
mov byte[esi],"o"
jmp imprimir_2o

;--------------------------------------------------------------------------

suma2_9o:
mov al, [variable12]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable12],dl
;*************************************************************************

mov esi,fila_1

add esi,11
mov byte[esi],"o"
jmp imprimir_2o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma3_1o:
mov al, [variable20]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable20],dl
;*************************************************************************

mov esi,fila_2

add esi,3
mov byte[esi],"o"

jmp imprimir_2o
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
suma3_5o:
mov al, [variable21]
cmp al,0
jne Posicion_2o
;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable21],dl
;*************************************************************************

mov esi,fila_2

add esi,7
mov byte[esi],"o"
jmp imprimir_2o

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
suma3_9o:

mov al, [variable22]
cmp al,0
jne Posicion_2o

;****************Se pone o en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable22],dl
;*************************************************************************

mov esi,fila_2

add esi,11
mov byte[esi],"o"
jmp imprimir_2o
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_2o:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6

;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 3 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 3 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 3 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 713 hasta la linea 931):
; En este caso se pedira al jugador1 que ingrese una coordenada en la que desee colocar una "x", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 1 en en la variable correspondiente y tambien colocara una "x" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_3x:
recibe num2,2

imprime msg1,len_msg1
recibe num2,2

mov cx,[num2]

mov ah,[num2]
cmp ah, 27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je suma1_1x

cmp cx, "01"
je suma1_5x

cmp cx, "02"
je suma1_9x
;--------------------------------------------------------------------------
cmp cx, "10"
je suma1_2_1x

cmp cx, "11"
je suma1_2_5x

cmp cx, "12"
je suma1_2_9x

;--------------------------------------------------------------------------
cmp cx, "20"
je suma1_3_1x

cmp cx, "21"
je suma1_3_5x

cmp cx, "22"
je suma1_3_9x

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

suma1_1x:
mov al, [variable00]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable00],dl
;*************************************************************************

mov esi,fila_0

add esi,3
mov byte[esi],"x"

jmp imprimir_3x
;--------------------------------------------------------------------------

suma1_5x:
mov al, [variable01]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable01],dl
;*************************************************************************

mov esi,fila_0
add esi,7
mov byte[esi],"x"

jmp imprimir_3x

;--------------------------------------------------------------------------

suma1_9x:
mov al, [variable02]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable02],dl
;*************************************************************************

mov esi,fila_0

add esi,11
mov byte[esi],"x"
jmp imprimir_3x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma1_2_1x:
mov al, [variable10]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable10],dl
;*************************************************************************

mov esi,fila_1

add esi,3
mov byte[esi],"x"

jmp imprimir_3x
;--------------------------------------------------------------------------

suma1_2_5x:
mov al, [variable11]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable11],dl
;*************************************************************************

mov esi,fila_1

add esi,7
mov byte[esi],"x"
jmp imprimir_3x

;--------------------------------------------------------------------------

suma1_2_9x:
mov al, [variable12]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable12],dl
;*************************************************************************

mov esi,fila_1

add esi,11
mov byte[esi],"x"
jmp imprimir_3x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma1_3_1x:
mov al, [variable20]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable20],dl
;*************************************************************************

mov esi,fila_2

add esi,3
mov byte[esi],"x"

jmp imprimir_3x
;--------------------------------------------------------------------------

suma1_3_5x:
mov al, [variable21]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable21],dl
;*************************************************************************

mov esi,fila_2

add esi,7
mov byte[esi],"x"
jmp imprimir_3x

;--------------------------------------------------------------------------

suma1_3_9x:
mov al, [variable22]
cmp al,0
jne Posicion_3x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable22],dl
;*************************************************************************

mov esi,fila_2

add esi,11
mov byte[esi],"x"
jmp imprimir_3x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_3x:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6


;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 4 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 4 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 4 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 941 hasta la linea 1161):
; En este caso se pedira al jugador2 que ingrese una coordenada en la que desee colocar un "o", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 2 en en la variable correspondiente y tambien colocara un "o" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_4o:
recibe num3,2

imprime msg2,len_msg2
recibe num3,2

mov cx,[num3]
mov ah,[num3]
cmp ah, 27
je inicio

;-------------------------------------------------------------------------
cmp cx, "00"
je suma1_1o

cmp cx, "01"
je suma1_5o

cmp cx, "02"
je suma1_9o
;--------------------------------------------------------------------------
cmp cx, "10"
je suma1_2_1o

cmp cx, "11"
je suma1_2_5o

cmp cx, "12"
je suma1_2_9o

;--------------------------------------------------------------------------
cmp cx, "20"
je suma1_3_1o

cmp cx, "21"
je suma1_3_5o

cmp cx, "22"
je suma1_3_9o

jmp Posicion_4o

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

suma1_1o:
mov al, [variable00]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable00],dl
;*************************************************************************

mov esi,fila_0

add esi,3
mov byte[esi],"o"

jmp imprimir_4o
;--------------------------------------------------------------------------

suma1_5o:
mov al, [variable01]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable01],dl
;*************************************************************************

mov esi,fila_0

add esi,7
mov byte[esi],"o"
jmp imprimir_4o

;--------------------------------------------------------------------------

suma1_9o:
mov al, [variable02]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable02],dl
;*************************************************************************

mov esi,fila_0

add esi,11
mov byte[esi],"o"
jmp imprimir_4o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma1_2_1o:
mov al, [variable10]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable10],dl
;*************************************************************************

mov esi,fila_1

add esi,3
mov byte[esi],"o"

jmp imprimir_4o
;--------------------------------------------------------------------------

suma1_2_5o:
mov al, [variable11]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable11],dl
;*************************************************************************

mov esi,fila_1

add esi,7
mov byte[esi],"o"
jmp imprimir_4o

;--------------------------------------------------------------------------

suma1_2_9o:
mov al, [variable12]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable12],dl
;*************************************************************************

mov esi,fila_1

add esi,11
mov byte[esi],"o"
jmp imprimir_4o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma1_3_1o:
mov al, [variable20]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable20],dl
;*************************************************************************

mov esi,fila_2

add esi,3
mov byte[esi],"o"

jmp imprimir_4o
;--------------------------------------------------------------------------

suma1_3_5o:
mov al, [variable21]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable21],dl
;*************************************************************************

mov esi,fila_2

add esi,7
mov byte[esi],"o"
jmp imprimir_4o

;--------------------------------------------------------------------------

suma1_3_9o:
mov al, [variable22]
cmp al,0
jne Posicion_4o
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable22],dl
;*************************************************************************

mov esi,fila_2

add esi,11
mov byte[esi],"o"
jmp imprimir_4o
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_4o:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6


;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 5 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 5 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 5 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 1171 hasta la linea 1394):
; En este caso se pedira al jugador1 que ingrese una coordenada en la que desee colocar una "x", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 1 en en la variable correspondiente y tambien colocara una "x" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_5x:

recibe num4,2

imprime msg1,len_msg1
recibe num4,2

mov cx,[num4]

mov ah,[num4]
cmp ah, 27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je Suma2_1x

cmp cx, "01"
je Suma2_5x

cmp cx, "02"
je Suma2_9x
;--------------------------------------------------------------------------
cmp cx, "10"
je suma2_2_1x

cmp cx, "11"
je suma2_2_5x

cmp cx, "12"
je suma2_2_9x

;--------------------------------------------------------------------------
cmp cx, "20"
je suma2_3_1x

cmp cx, "21"
je suma2_3_5x

cmp cx, "22"
je suma2_3_9x

jmp Posicion_5x

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

Suma2_1x:
mov al, [variable00]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable00],dl
;*************************************************************************

mov esi,fila_0

add esi,3
mov byte[esi],"x"

jmp imprimir_5x
;--------------------------------------------------------------------------

Suma2_5x:
mov al, [variable01]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable01],dl
;*************************************************************************

mov esi,fila_0

add esi,7
mov byte[esi],"x"
jmp imprimir_5x

;--------------------------------------------------------------------------

Suma2_9x:
mov al, [variable02]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable02],dl
;*************************************************************************

mov esi,fila_0

add esi,11
mov byte[esi],"x"
jmp imprimir_5x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma2_2_1x:
mov al, [variable10]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable10],dl
;*************************************************************************

mov esi,fila_1

add esi,3
mov byte[esi],"x"

jmp imprimir_5x
;--------------------------------------------------------------------------

suma2_2_5x:
mov al, [variable11]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable11],dl
;*************************************************************************

mov esi,fila_1

add esi,7
mov byte[esi],"x"
jmp imprimir_5x

;--------------------------------------------------------------------------

suma2_2_9x:
mov al, [variable12]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable12],dl
;*************************************************************************

mov esi,fila_1

add esi,11
mov byte[esi],"x"
jmp imprimir_5x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma2_3_1x:
mov al, [variable20]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable20],dl
;*************************************************************************

mov esi,fila_2

add esi,3
mov byte[esi],"x"

jmp imprimir_5x
;--------------------------------------------------------------------------

suma2_3_5x:
mov al, [variable21]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable21],dl
;*************************************************************************

mov esi,fila_2

add esi,7
mov byte[esi],"x"
jmp imprimir_5x

;--------------------------------------------------------------------------

suma2_3_9x:
mov al, [variable22]
cmp al,0
jne Posicion_5x
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable22],dl
;*************************************************************************

mov esi,fila_2

add esi,11
mov byte[esi],"x"
jmp imprimir_5x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_5x:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6

jmp fila1

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 1403 hasta la linea 1553):
; En este caso lo que hara el programa son las comparaciones de las variables, comparará cada una por medio de saltos, comparando la primera con la segunda y la segunda con la tercera, en caso de que las tres tengan un 1 o que las tres tengan un 2, saltara e imprimira en pantalla el ganador, si aun no hay 3 en linea seguira son el proceso normal. 


fila1_final1:

mov ch,[variable02]
cmp ah,ch
je salir_y_ganar
jmp fila2

fila1:

mov ah,[variable00]
cmp ah,1
jne fila2

mov bh,[variable01]
cmp ah,bh
je fila1_final1

jmp fila2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila2_final1:
mov ch,[variable12]
cmp ch,1
jne fila3

cmp ah,ch
je salir_y_ganar
jmp fila3

fila2:

mov ah,[variable10]
cmp ah,1
jne fila3

mov bh,[variable11]
cmp bh,1
jne fila3

cmp ah,bh
je fila2_final1

jmp fila3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila3_final1:
mov ch,[variable22]
cmp ah,ch
je salir_y_ganar
jmp esquina_derecha

fila3:
xor ah,ah
xor bh,bh
xor ch,ch

mov ah,[variable20]
cmp ah, 1
jne esquina_derecha

mov bh,[variable21]
cmp ah,bh
je fila3_final1
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
esquina_derecha:
mov ah,[variable00]

cmp ah,1
jne medio1
;------------------------------------------------------------------------
bajo1:

mov bh,[variable10]
cmp ah,bh
je bajo_final1
;------------------------------------------------------------------------
diagonal1:

mov bh,[variable11]
cmp ah,bh
je diagonal_final1
jmp medio1
;------------------------------------------------------------------------
bajo_final1:

mov ch,[variable20]
cmp bh,ch
je salir_y_ganar
jmp diagonal1
;------------------------------------------------------------------------
diagonal_final1:

mov ch,[variable22]
cmp bh,ch
je salir_y_ganar
jmp medio1
;------------------------------------------------------------------------
;------------------------------------------------------------------------
medio_final1:
mov ch,[variable21]
cmp bh,ch
je salir_y_ganar
jmp bajoizq1
;------------------------------------------------------------------------
medio1:

mov ah,[variable01]
cmp ah,1
jne bajoizq1

mov bh,[variable11]
cmp ah,bh
je medio_final1
;------------------------------------------------------------------------
;-------------------------------------------------------------------------


;------------------------------------------------------------------------
bajoizq1:
xor ah,ah
xor bh,bh
xor ch,ch

mov ah,[variable02]
cmp ah,1
jne Posicion_6o

mov bh,[variable12]
cmp ah,bh
je bajoizq_final1
;------------------------------------------------------------------------
diagonalizq1:
xor bh,bh
mov bh,[variable11]
cmp ah,bh
je diagonalizq_final1
jmp Posicion_6o
;------------------------------------------------------------------------
bajoizq_final1:
mov bh,[variable12]
mov ch,[variable22]
cmp bh,ch
jne diagonalizq1
jmp salir_y_ganar
;------------------------------------------------------------------------
diagonalizq_final1:
xor ch,ch
mov ch,[variable20]
cmp bh,ch
je salir_y_ganar

;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 6 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 6 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 6 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 1562 hasta la linea 1774):
; En este caso se pedira al jugador2 que ingrese una coordenada en la que desee colocar un "o", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 2 en en la variable correspondiente y tambien colocara un "o" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_6o:
recibe num5,2

imprime msg2,len_msg2
recibe num5,2
mov cx,[num5]

mov ah,[num5]
cmp ah, 27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je Suma3_1o

cmp cx, "01"
je Suma3_5o

cmp cx, "02"
je Suma3_9o
;--------------------------------------------------------------------------
cmp cx, "10"
je suma3_2_1o

cmp cx, "11"
je suma3_2_5o

cmp cx, "12"
je suma3_2_9o

;--------------------------------------------------------------------------
cmp cx, "20"
je suma3_3_1o

cmp cx, "21"
je suma3_3_5o

cmp cx, "22"
je suma3_3_9o

jmp Posicion_6o

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

Suma3_1o:
mov al, [variable00]
cmp al,0
jne Posicion_6o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable00],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_6o
;--------------------------------------------------------------------------

Suma3_5o:
mov al, [variable01]
cmp al,0
jne Posicion_6o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable01],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_6o

;--------------------------------------------------------------------------

Suma3_9o:
mov al, [variable02]
cmp al,0
jne Posicion_6o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable02],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_6o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma3_2_1o:
mov al, [variable10]
cmp al,0
jne Posicion_6o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable10],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_6o
;--------------------------------------------------------------------------

suma3_2_5o:
mov al, [variable11]
cmp al,0
jne Posicion_6o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable11],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_6o

;--------------------------------------------------------------------------

suma3_2_9o:
mov al, [variable12]
cmp al,0
jne Posicion_6o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable12],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_6o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma3_3_1o:
mov al, [variable20]
cmp al,0
jne Posicion_6o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable20],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_6o
;--------------------------------------------------------------------------

suma3_3_5o:
mov al, [variable21]
cmp al,0
jne Posicion_6o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable21],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_6o

;--------------------------------------------------------------------------

suma3_3_9o:
mov al, [variable22]
cmp al,0
jne Posicion_6o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable22],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_6o
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_6o:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6

jmp fila1_2

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 1782 hasta la linea 1923):
; En este caso lo que hara el programa son las comparaciones de las variables, comparará cada una por medio de saltos, comparando la primera con la segunda y la segunda con la tercera, en caso de que las tres tengan un 1 o que las tres tengan un 2, saltara e imprimira en pantalla el ganador, si aun no hay 3 en linea seguira son el proceso normal. 

fila1_final2:

mov ch,[variable02]
cmp ah,ch
je salir_y_ganar2
jmp fila2_2

fila1_2:

mov ah,[variable00]
cmp ah,2
jne fila2_2

mov bh,[variable01]
cmp ah,bh
je fila1_final2

jmp fila2_2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila2_final2:
mov ch,[variable12]
cmp ch,2
jne fila3_2

cmp ah,ch
je salir_y_ganar2
jmp fila3_2

fila2_2:
mov ah,[variable10]
cmp ah,2
jne fila3_2

mov bh,[variable11]
cmp bh,2
jne fila3_2

cmp ah,bh
je fila2_final2

jmp fila3_2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila3_final2:
mov ch,[variable22]
cmp ah,ch
je salir_y_ganar2
jmp esquina_derecha2

fila3_2:

mov ah,[variable20]
cmp ah,2
jne esquina_derecha2

mov bh,[variable21]
cmp ah,bh
je fila3_final2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
esquina_derecha2:
mov ah,[variable00]

cmp ah,2
jne medio1_2
;------------------------------------------------------------------------
bajo1_2:

mov bh,[variable10]
cmp ah,bh
je bajo_final1_2
;------------------------------------------------------------------------
diagonal1_2:

mov bh,[variable11]
cmp ah,bh
je diagonal_final1_2
jmp medio1_2
;------------------------------------------------------------------------
bajo_final1_2:

mov ch,[variable20]
cmp bh,ch
je salir_y_ganar2
jmp diagonal1_2
;------------------------------------------------------------------------
diagonal_final1_2:

mov ch,[variable22]
cmp bh,ch
je salir_y_ganar2
jmp medio1_2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
medio_final1_2:
mov ch,[variable21]
cmp bh,ch
je salir_y_ganar2
jmp bajoizq1_2
;------------------------------------------------------------------------
medio1_2:

mov ah,[variable01]
cmp ah,2
jne bajoizq1_2

mov bh,[variable11]
cmp ah,bh
je medio_final1_2
;------------------------------------------------------------------------
;------------------------------------------------------------------------
;Esquina izquierda
bajoizq1_2:

mov ah,[variable02]
cmp ah,2
jne Posicion_7x

mov bh,[variable12]
cmp ah,bh
je bajoizq_final1_2
;------------------------------------------------------------------------
diagonalizq1_2:
xor bh,bh
mov bh,[variable11]
cmp ah,bh
je diagonalizq_final1_2
jmp Posicion_7x
;------------------------------------------------------------------------
bajoizq_final1_2:
mov bh,[variable12]
mov ch,[variable22]
cmp bh,ch
jne diagonalizq1_2
jmp salir_y_ganar2
;------------------------------------------------------------------------
diagonalizq_final1_2:
xor ch,ch
mov ch,[variable20]
cmp bh,ch
je salir_y_ganar2
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 7 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 7 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 7 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 1931 hasta la linea 2144):
; En este caso se pedira al jugador1 que ingrese una coordenada en la que desee colocar una "x", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 1 en en la variable correspondiente y tambien colocara una "x" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_7x:
recibe num6,2

imprime msg1,len_msg1
recibe num6,2

mov cx,[num6]

mov ah,[num6]
cmp ah, 27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je Suma4_1x

cmp cx, "01"
je Suma4_5x

cmp cx, "02"
je Suma4_9x
;--------------------------------------------------------------------------
cmp cx, "10"
je suma4_2_1x

cmp cx, "11"
je suma4_2_5x

cmp cx, "12"
je suma4_2_9x

;--------------------------------------------------------------------------
cmp cx, "20"
je suma4_3_1x

cmp cx, "21"
je suma4_3_5x

cmp cx, "22"
je suma4_3_9x

jmp Posicion_7x
;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

Suma4_1x:
mov al, [variable00]
cmp al,0
jne Posicion_7x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable00],dl
;*************************************************************************

add esi,3
mov byte[esi],"x"

jmp imprimir_7x
;--------------------------------------------------------------------------

Suma4_5x:
mov al, [variable01]
cmp al,0
jne Posicion_7x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable01],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_7x

;--------------------------------------------------------------------------

Suma4_9x:
mov al, [variable02]
cmp al,0
jne Posicion_7x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable02],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_7x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma4_2_1x:
mov al, [variable10]
cmp al,0
jne Posicion_7x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable10],dl
;*************************************************************************
add esi,3
mov byte[esi],"x"

jmp imprimir_7x
;--------------------------------------------------------------------------

suma4_2_5x:
mov al, [variable11]
cmp al,0
jne Posicion_7x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable11],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_7x

;--------------------------------------------------------------------------

suma4_2_9x:
mov al, [variable12]
cmp al,0
jne Posicion_7x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable12],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_7x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma4_3_1x:
mov al, [variable20]
cmp al,0
jne Posicion_7x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable20],dl
;*************************************************************************

add esi,3
mov byte[esi],"x"

jmp imprimir_7x
;--------------------------------------------------------------------------

suma4_3_5x:
mov al, [variable21]
cmp al,0
jne Posicion_7x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable21],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_7x

;--------------------------------------------------------------------------

suma4_3_9x:
mov al, [variable22]
cmp al,0
jne Posicion_7x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable22],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_7x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_7x:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6



jmp fila1_3

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 2152 hasta la linea 2293):
; En este caso lo que hara el programa son las comparaciones de las variables, comparará cada una por medio de saltos, comparando la primera con la segunda y la segunda con la tercera, en caso de que las tres tengan un 1 o que las tres tengan un 2, saltara e imprimira en pantalla el ganador, si aun no hay 3 en linea seguira son el proceso normal. 

fila1_final3:

mov ch,[variable02]
cmp ah,ch
je salir_y_ganar
jmp fila2_3

fila1_3:

mov ah,[variable00]
cmp ah,1
jne fila2_3

mov bh,[variable01]
cmp ah,bh
je fila1_final3

jmp fila2_3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila2_final3:
mov ch,[variable12]
cmp ch,1
jne fila3_3

cmp ah,ch
je salir_y_ganar
jmp fila3_3

fila2_3:
mov ah,[variable10]
cmp ah,1
jne fila3_3

mov bh,[variable11]
cmp bh,1
jne fila3_3

cmp ah,bh
je fila2_final3

jmp fila3_3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila3_final3:
mov ch,[variable22]
cmp ah,ch
je salir_y_ganar
jmp esquina_derecha3

fila3_3:

mov ah,[variable20]
cmp ah,1
jne esquina_derecha3

mov bh,[variable21]
cmp ah,bh
je fila3_final3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
esquina_derecha3:
mov ah,[variable00]

cmp ah,1
jne medio1_3
;------------------------------------------------------------------------
bajo1_3:

mov bh,[variable10]
cmp ah,bh
je bajo_final1_3
;------------------------------------------------------------------------
diagonal1_3:

mov bh,[variable11]
cmp ah,bh
je diagonal_final1_3
jmp medio1_3
;------------------------------------------------------------------------
bajo_final1_3:

mov ch,[variable20]
cmp bh,ch
je salir_y_ganar
jmp diagonal1_3
;------------------------------------------------------------------------
diagonal_final1_3:

mov ch,[variable22]
cmp bh,ch
je salir_y_ganar
jmp medio1_3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
medio_final1_3:
mov ch,[variable21]
cmp bh,ch
je salir_y_ganar
jmp bajoizq1_3
;------------------------------------------------------------------------
medio1_3:

mov ah,[variable01]
cmp ah,1
jne bajoizq1_3

mov bh,[variable11]
cmp ah,bh
je medio_final1_3
;------------------------------------------------------------------------
;------------------------------------------------------------------------
;Esquina izquierda
bajoizq1_3:

mov ah,[variable02]
cmp ah,1
jne Posicion_8o

mov bh,[variable12]
cmp ah,bh
je bajoizq_final1_3
;------------------------------------------------------------------------
diagonalizq1_3:
xor bh,bh
mov bh,[variable11]
cmp ah,bh
je diagonalizq_final1_3
jmp Posicion_8o
;------------------------------------------------------------------------
bajoizq_final1_3:
mov bh,[variable12]
mov ch,[variable22]
cmp bh,ch
jne diagonalizq1_3
jmp salir_y_ganar
;------------------------------------------------------------------------
diagonalizq_final1_3:
xor ch,ch
mov ch,[variable20]
cmp bh,ch
je salir_y_ganar

;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 8 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 8 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 8 "O"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 2302 hasta la linea 2515):
; En este caso se pedira al jugador2 que ingrese una coordenada en la que desee colocar un "o", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 2 en en la variable correspondiente y tambien colocara un "o" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_8o:

recibe num7,2

imprime msg2,len_msg2
recibe num7,2
mov cx,[num7]

mov ah,[num7]
cmp ah, 27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je Suma5_1o

cmp cx, "01"
je Suma5_5o

cmp cx, "02"
je Suma5_9o
;--------------------------------------------------------------------------
cmp cx, "10"
je suma5_2_1o

cmp cx, "11"
je suma5_2_5o

cmp cx, "12"
je suma5_2_9o

;--------------------------------------------------------------------------
cmp cx, "20"
je suma5_3_1o

cmp cx, "21"
je suma5_3_5o

cmp cx, "22"
je suma5_3_9o

jmp Posicion_8o

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------

Suma5_1o:
mov al, [variable00]
cmp al,0
jne Posicion_8o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable00],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_8o
;--------------------------------------------------------------------------

Suma5_5o:
mov al, [variable01]
cmp al,0
jne Posicion_8o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable01],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_8o

;--------------------------------------------------------------------------

Suma5_9o:
mov al, [variable02]
cmp al,0
jne Posicion_8o
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable02],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_8o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma5_2_1o:
mov al, [variable10]
cmp al,0
jne Posicion_8o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable10],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_8o
;--------------------------------------------------------------------------

suma5_2_5o:
mov al, [variable11]
cmp al,0
jne Posicion_8o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable11],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_8o

;--------------------------------------------------------------------------

suma5_2_9o:
mov al, [variable12]
cmp al,0
jne Posicion_8o
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable12],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_8o

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma5_3_1o:
mov al, [variable20]
cmp al,0
jne Posicion_8o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable20],dl
;*************************************************************************

add esi,3
mov byte[esi],"o"

jmp imprimir_8o
;--------------------------------------------------------------------------

suma5_3_5o:
mov al, [variable21]
cmp al,0
jne Posicion_8o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable21],dl
;*************************************************************************

add esi,7
mov byte[esi],"o"
jmp imprimir_8o

;--------------------------------------------------------------------------

suma5_3_9o:
mov al, [variable22]
cmp al,0
jne Posicion_8o
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,2
mov [variable22],dl
;*************************************************************************

add esi,11
mov byte[esi],"o"
jmp imprimir_8o
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_8o:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2
imprime msg4,len_msg4
imprime msg5,len_msg5
imprime msg6,len_msg6

jmp fila1_4

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 2523 hasta la linea 2663):
; En este caso lo que hara el programa son las comparaciones de las variables, comparará cada una por medio de saltos, comparando la primera con la segunda y la segunda con la tercera, en caso de que las tres tengan un 1 o que las tres tengan un 2, saltara e imprimira en pantalla el ganador, si aun no hay 3 en linea seguira son el proceso normal. 

fila1_final4:

mov ch,[variable02]
cmp bh,ch
je salir_y_ganar2
jmp fila2_4

fila1_4:

mov ah,[variable00]
cmp ah,2
jne fila2_4

mov bh,[variable01]
cmp ah,bh
je fila1_final4
jmp fila2_4
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila2_final4:
mov ch,[variable12]
cmp ch,2
jne fila3_4

cmp ah,ch
je salir_y_ganar2
jmp fila3_4

fila2_4:
mov ah,[variable10]
cmp ah,2
jne fila3_4

mov bh,[variable11]
cmp bh,2
jne fila3_4

cmp ah,bh
je fila2_final4

jmp fila3_4
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila3_final4:
mov ch,[variable22]
cmp ah,ch
je salir_y_ganar2
jmp esquina_derecha4

fila3_4:

mov ah,[variable20]
cmp ah,2
jne esquina_derecha4

mov bh,[variable21]
cmp ah,bh
je fila3_final4
;------------------------------------------------------------------------
;------------------------------------------------------------------------
esquina_derecha4:
mov ah,[variable00]

cmp ah,2
jne medio1_4
;------------------------------------------------------------------------
bajo1_4:

mov bh,[variable10]
cmp ah,bh
je bajo_final1_4
;------------------------------------------------------------------------
diagonal1_4:

mov bh,[variable11]
cmp ah,bh
je diagonal_final1_4
jmp medio1_4
;------------------------------------------------------------------------
bajo_final1_4:

mov ch,[variable20]
cmp bh,ch
je salir_y_ganar2
jmp diagonal1_4
;------------------------------------------------------------------------
diagonal_final1_4:

mov ch,[variable22]
cmp bh,ch
je salir_y_ganar2
jmp medio1_4
;------------------------------------------------------------------------
;------------------------------------------------------------------------
medio_final1_4:
mov ch,[variable21]
cmp bh,ch
je salir_y_ganar2
jmp bajoizq1_4
;------------------------------------------------------------------------
medio1_4:

mov ah,[variable01]
cmp ah,2
jne bajoizq1_4

mov bh,[variable11]
cmp ah,bh
je medio_final1_4
;------------------------------------------------------------------------
;------------------------------------------------------------------------
;Esquina izquierda
bajoizq1_4:

mov ah,[variable02]
cmp ah,2
jne Posicion_9x

mov bh,[variable12]
cmp ah,bh
je bajoizq_final1_4
;------------------------------------------------------------------------
diagonalizq1_4:
xor bh,bh
mov bh,[variable11]
cmp ah,bh
je diagonalizq_final1_4
jmp Posicion_9x
;------------------------------------------------------------------------
bajoizq_final1_4:
mov bh,[variable12]
mov ch,[variable22]
cmp bh,ch
jne diagonalizq1_4
jmp salir_y_ganar2
;------------------------------------------------------------------------
diagonalizq_final1_4:
xor ch,ch
mov ch,[variable20]
cmp bh,ch
je salir_y_ganar2

;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 9 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 9 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~ENTRADA NUMERO 9 "X"~~~~~~~~~~~~~~~~~~~~~~~~~~~~

; Objetivo del procedimiento (de la linea 2672 hasta la linea 2884):
; En este caso se pedira al jugador1 que ingrese una coordenada en la que desee colocar una "x", una vez ingresada la coordenada se comparará esta con todas las posibles coordenadas, cuando se encuentre la coordenada que se ingresó, el programa saltará a la sección de codigo que primero validará que dicha posición esté vacía (en caso de que anteriormente se haya seleccionado esa posición el programa le pedira al usuario que ingrese de nuevo la coordenada) para luego colocar un 1 en en la variable correspondiente y tambien colocara una "x" en la matriz en el lugar deseado. Al final se imprimiran los respectivos mensajes junto con la matriz actualizada.

Posicion_9x:

recibe num8,3

imprime msg1,len_msg1
recibe num8,3

mov cx,[num8]
mov ah,[num8]

cmp ah,27
je inicio
;-------------------------------------------------------------------------
cmp cx, "00"
je Suma6_1x

cmp cx, "01"
je Suma6_5x

cmp cx, "02"
je Suma6_9x
;--------------------------------------------------------------------------
cmp cx, "10"
je suma6_2_1x

cmp cx, "11"
je suma6_2_5x

cmp cx, "12"
je suma6_2_9x

;--------------------------------------------------------------------------
cmp cx, "20"
je suma6_3_1x

cmp cx, "21"
je suma6_3_5x

cmp cx, "22"
je suma6_3_9x

jmp salir_y_ganar2

;--------------------------------------------------------------------------
;--------------------------recorrido fila 0-------------------------------
;--------------------------------------------------------------------------


Suma6_1x:
mov al, [variable00]
cmp al,0
jne Posicion_9x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable00],dl
;*************************************************************************

add esi,3
mov byte[esi],"x"

jmp imprimir_9x
;--------------------------------------------------------------------------

Suma6_5x:
mov al, [variable01]
cmp al,0
jne Posicion_9x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable01],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_9x

;--------------------------------------------------------------------------

Suma6_9x:
mov al, [variable02]
cmp al,0
jne Posicion_9x
mov esi,fila_0
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable02],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_9x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_1--------------------------------
;--------------------------------------------------------------------------

suma6_2_1x:
mov al, [variable10]
cmp al,0
jne Posicion_9x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable10],dl
;*************************************************************************

add esi,3
mov byte[esi],"x"

jmp imprimir_9x
;--------------------------------------------------------------------------

suma6_2_5x:
mov al, [variable11]
cmp al,0
jne Posicion_9x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable11],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_9x

;--------------------------------------------------------------------------

suma6_2_9x:
mov al, [variable12]
cmp al,0
jne Posicion_9x
mov esi,fila_1
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable12],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_9x

;--------------------------------------------------------------------------
;-------------------------recorrido_fila_2--------------------------------
;--------------------------------------------------------------------------

suma6_3_1x:
mov al, [variable20]
cmp al,0
jne Posicion_9x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable20],dl
;*************************************************************************

add esi,3
mov byte[esi],"x"

jmp imprimir_9x
;--------------------------------------------------------------------------

suma6_3_5x:
mov al, [variable21]
cmp al,0
jne Posicion_9x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable21],dl
;*************************************************************************

add esi,7
mov byte[esi],"x"
jmp imprimir_9x

;--------------------------------------------------------------------------

suma6_3_9x:
mov al, [variable22]
cmp al,0
jne Posicion_9x
mov esi,fila_2
;****************Se pone x en la respectiva variable**********************
xor dl,dl
mov dl,1
mov [variable22],dl
;*************************************************************************

add esi,11
mov byte[esi],"x"
jmp imprimir_9x
;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

imprimir_9x:
imprime msg7,len_msg7
imprime fila,len_fila
imprime fila_0,len_fila_0
imprime fila_1,len_fila_1
imprime fila_2,len_fila_2

jmp fila1_5

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 2892 hasta la linea 3034):
; En este caso lo que hara el programa son las comparaciones de las variables, comparará cada una por medio de saltos, comparando la primera con la segunda y la segunda con la tercera, en caso de que las tres tengan un 1 o que las tres tengan un 2, saltara e imprimira en pantalla el ganador, si aun no hay 3 en linea seguira son el proceso normal. 

fila1_final5:

mov ch,[variable02]
cmp ah,ch
je salir_y_ganar
jmp fila2_5

fila1_5:

mov ah,[variable00]
cmp ah,1
jne fila2_5

mov bh,[variable01]
cmp ah,bh
je fila1_final5

jmp fila2_5
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila2_final5:
mov ch,[variable12]
cmp ch,1
jne fila3_5

cmp ah,ch
je salir_y_ganar
jmp fila3_5

fila2_5:
mov ah,[variable10]

cmp ah,1
jne fila3_5

mov bh,[variable11]
cmp bh,1
jne fila3_5

cmp ah,bh
je fila2_final5

jmp fila3_5
;------------------------------------------------------------------------
;------------------------------------------------------------------------
fila3_final5:
mov ch,[variable22]
cmp ah,ch
je salir_y_ganar
jmp esquina_derecha5

fila3_5:

mov ah,[variable20]
cmp ah,1
jne esquina_derecha5

mov bh,[variable21]
cmp ah,bh
je fila3_final5
;------------------------------------------------------------------------
;------------------------------------------------------------------------
esquina_derecha5:
mov ah,[variable00]

cmp ah,1
jne medio1_5
;------------------------------------------------------------------------
bajo1_5:

mov bh,[variable10]
cmp ah,bh
je bajo_final1_5
;------------------------------------------------------------------------
diagonal1_5:

mov bh,[variable11]
cmp ah,bh
je diagonal_final1_5
jmp medio1_5
;------------------------------------------------------------------------
bajo_final1_5:

mov ch,[variable20]
cmp bh,ch
je salir_y_ganar
jmp diagonal1_5
;------------------------------------------------------------------------
diagonal_final1_5:

mov ch,[variable22]
cmp bh,ch
je salir_y_ganar
jmp medio1_5
;------------------------------------------------------------------------
;------------------------------------------------------------------------
medio_final1_5:
mov ch,[variable21]
cmp bh,ch
je salir_y_ganar
jmp bajoizq1_5
;------------------------------------------------------------------------
medio1_5:

mov ah,[variable01]
cmp ah,1
jne bajoizq1_5

mov bh,[variable11]
cmp ah,bh
je medio_final1_5
;------------------------------------------------------------------------
;------------------------------------------------------------------------
;Esquina izquierda
bajoizq1_5:

mov ah,[variable02]
cmp ah,1
jne empate

mov bh,[variable12]
cmp ah,bh
je bajoizq_final1_5
;------------------------------------------------------------------------
diagonalizq1_5:
xor bh,bh
mov bh,[variable11]
cmp ah,bh
je diagonalizq_final1_5
jmp empate
;------------------------------------------------------------------------
bajoizq_final1_5:
mov bh,[variable12]
mov ch,[variable22]
cmp bh,ch
jne diagonalizq1_5
jmp salir_y_ganar
;------------------------------------------------------------------------
diagonalizq_final1_5:
xor ch,ch
mov ch,[variable20]
cmp bh,ch
je salir_y_ganar

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------

; Objetivo del procedimiento (de la linea 3039 hasta la linea 3066):
; En este caso los procedimientos que siguen son para imprimir cual es el jugador ganador o si es empate y posteriormente finalizara el programa.

empate:
imprime codigo4,lencodigo4
imprime msg10,len_msg10
mov eax,1
mov ebx,0
int 80h

salir_y_ganar:
imprime codigo2,lencodigo2
imprime msg8,len_msg8
mov eax,1
mov ebx,0
int 80h

salir_y_ganar2:
imprime codigo3,lencodigo3
imprime msg9,len_msg9
mov eax,1
mov ebx,0
int 80h

salir:
mov eax,1
mov ebx,0
int 80h
