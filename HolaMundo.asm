.model
.stack
.data
    saludo  db "hola mundo!!!",, "$"
        
.code

main proc
   mov ax,seg saludo
   mov ds,ax
    
   mov ah,09
   lea dx,saludo 
   int 21h
    
    
    
   mov ax,4c00h
   int 21h
    
main endp
end main