.model small
.stack
.data
 
    opcion_1  db  'Suma: $'
    opcion_2  db  'Resta: $'
    opcion_3  db  'Multiplicacion: $'
    opcion_i  db  'Opcion invalida$'
    ingreso   db  'Ingrese un numero:',10,13,'::[1]Suma :: ::[2]Resta ::',10,13,'::[3]Multiplicacion :: ::[4]Division ::',10,13,'$'
   	txtvalor1 db 'Ingrese el primer valor:$'
	txtvalor2 db 'Ingrese el segundo valor:$'
    newline   db  10,13,'$'
	valor1  db ?
    valor2  db ?
 	numero  db ?
 
.code
    ; directiva que indica el inicio de
    ; código a ser procesado
.startup
 
    ; Se imprime el texto de apoyo
    ; para el ingreso del número
 
    lea dx, ingreso
    mov ah, 09h
    int 21h
 
    ; Se lee el valor numérico en formato
    ; de caracter.
    mov ah, 01h
    int 21h
 
    ; Se coloca el valor en la variable de
    ; apoyo.
    mov numero, al
    sub numero, 30h; Se convierte el valor de caracter en valor numérico.
 
    ; Se imprime un salto de linea
    lea dx, newline
    mov ah, 09h
    int 21h
 
    ; Se pregunta si el valor es igual a 1
    cmp numero, 01h
    je Imp_Op1
    ; Se pregunta si el valor es igual a 2
 
    cmp numero, 02h
    je Imp_Op2
    ; Se imprime el mensaje de número invalido
 
    lea dx, opcion_i
    mov ah, 09h
    int 21h
 
    jmp salir
 
Imp_Op1:
 
     lea dx, txtValor1
     mov ah, 09h
     int 21h
 
     mov ah, 01h;Leer carácter desde el teclado
     int 21h    ;Lee primer caracter
     sub al, 30h  ;Resto 30H (48Dec) para obtener
     			  ;el número
 
     mov valor1, al ; Lo guardo en variable valor
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, txtValor2
     mov ah, 09h
     int 21h
 
     mov ah, 01h ;Leer carácter desde el teclado
     int 21h     ; Leo el segundo caracter
     sub al, 30h ; Resto 30H(48Dec) para obtener
 
     mov valor2, al; segundo valor
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, opcion_1
     mov ah, 09h
     int 21h
 
     mov ax, 00h
     add al, valor1 ;Realizo la suma de los dos valores
     add al, valor2
 
     mov dl, al  ;Pongo en dl el número a imprimir
     add dl, 30h ;Agrego 30(48Dec) para obtener el caracter
     mov ah, 02h ;Funcion para imprimir un caracter
     int 21h
 
    ; Se va a la etiqueta de salir
    jmp salir
 
Imp_Op2:
 
     lea dx, txtValor1
     mov ah, 09h
     int 21h
 
     mov ah, 01h;Leer carácter desde el teclado
     int 21h    ;Lee primer caracter
 
     add al, 30h  ;Resto 30H (48Dec) para obtener
     			  ;el número
 
     mov valor1, al ; Lo guardo en variable valor
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, txtValor2
     mov ah, 09h
     int 21h
 
     mov ah, 01h ;Leer carácter desde el teclado
     int 21h     ; Leo el segundo caracter
     sub al, 30h ; Resto 30H(48Dec) para obtener
     			 ; segundo valor
     mov valor2, al
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, newline
     mov ah, 09h
     int 21h
 
     lea dx, opcion_2
     mov ah, 09h
     int 21h
 
     mov ax, 00h
     add al, valor1 ;Realizo la suma de los dos valores
     sub al, valor2
 
     mov dl, al  ;Pongo en dl el número a imprimir
     sub dl, 30h ;Agrego 30(48Dec) para obtener el caracter
     mov ah, 02h ;Funcion para imprimir un caracter
     int 21h
 
salir:
 
.exit
end
