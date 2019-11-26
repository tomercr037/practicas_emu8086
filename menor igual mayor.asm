org 100h
.model small
.stack 64
.data 

    
    mensaje1 db 10,13, "ingresa nunero: $"
    mensaje2 db 10,13,"es menor  $"
    mensaje3 db 10,13,"es mayor  $"
    mensaje4 db 10,13,"es igual  $"
    num1 dw ? ;inicializa variable 
    
.code

mov ax,@data
mov ds,ax

mov ah,09 
lea dx,mensaje1
int 21h 

mov ah,01h
int 21h
mov ah,0
sub al,48
  mov num1, ax


cmp num1, 5 ;comparacion si es mayor o menor a 5
mov ah, 09h
jl menor   ;si es menor o igual
jg mayor    ;si es mayor o igual
je igual

igual:
    lea dx, mensaje4
    jmp final

menor:
    lea dx, mensaje2
    jmp final
mayor:
    lea dx, mensaje3
    
final: 
    int 21h
    mov ah, 4ch
    int 21h    
end      


;tarea hacer un programa para ingresar un numero de 2 digitos y otro de n numeros 