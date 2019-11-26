.model small
.data
msg db 10,13, "ingresa solamente numeros:$"
msg2 db 10,13, "El numero es mayor$"
msg3 db 10,13, "El numero es menor$"
msg4 db 10,13, "El numero es igual$"
msg5 db 10,13, "ERROR WEY!!! $"

num dw ?

.code 
    mov ax, @data 
    mov ds, ax
    mov ah, 09h ;para imprimir en pantalla
    lea dx, msg
    int 21h
    
    mov bx, 0
    
    
 ciclo:
    mov ah, 01h
    int 21h
    cmp al, 13 ;13 (salto de linea) es equivalente a enter      
    je fin
    cmp  al,048 
    jl fin2
    cmp al, 057
    jg fin2
    
    mov ah, 0
    sub al, 48
    
    mov cx, ax
    mov ax, 10
    mul bx
    mov bx, ax 
    add bx, cx
    
    jmp ciclo 


fin: 
 mov num,bx
 cmp num,5000
 
 jl menor
 jg mayor
 je igual
 
 
 igual:
    lea dx, msg4
    jmp final 
    
 menor: 
    lea dx,msg3 
    jmp final
 mayor:    
    lea dx,msg2 
    jmp final 
fin2:
    
    lea dx,msg5
    jmp final
final:
   
   mov ah,9h      
   int 21h
   mov ax,4c00h
   int 21h


end