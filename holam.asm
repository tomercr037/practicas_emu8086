org 100h
.model small
.stack 64
.data 

    
    mensaje db 10,13, "Hola :3$"
    msg3 db 13,10,13,10,'ordene numero de veces: $'
    num1 dw ?
    
.code

mov ax,@data
mov ds,ax

mov ah,09 
lea dx,msg3
int 21h

mov ah,01h
int 21h
mov ah,0
sub al,48
  mov num1,ax

mov cx,1 

ciclo: 

    mov ah,09h
    lea dx,mensaje
    int 21h        
               
    inc cx           
    cmp cx,num1
    jle ciclo

fin:

    mov ah,9ch
    int 21h
    
end