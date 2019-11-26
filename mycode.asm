.model small
.data
    msg1 db 10,13, "ingrese numero $ "
    msg2 db 10,13, "El numero es mayor$"
    msg3 db 10,13, "El numero es menor$"
    msg4 db 10,13, "El numero es igual$"
    num dw ?  
    
 .code
 mov ax,@data
 mov ds,ax
 
 mov ah,09h
 lea dx, msg1 ;imprime mensaje 1
 int 21h
 
; Leemos el primer digito 
         mov ah, 01h
         int 21h
         mov ah, 0
         sub al, 48
         mov bl,al
         mov ax, 10
         mul bx 
         mov bl, al
         
  ; Leemos el segundo digito 
         mov ah, 01h 
         int 21h 
         mov ah, 0
         sub al, 48 
         add al,bl
;;sumamos al segundo digito 
         ;pop cx 
         ;add cx, ax 
        
         ;lea dx, Finlinea 
                
        ; mov bx,0 
         
;:::::::::::::::::::::::::::::::::::::::
        
               
 mov num,ax
 cmp num,50
 mov ah, 9h
 
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
 final:
         
   int 21h
   mov ax,4c00h
   int 21h
end
 
   