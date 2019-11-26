.model small
.data 
     msg db 10, 13, "INGRESE CARACTER $"
car    DB 0
posx    DB 0
posy    DB 0
xa     DB 0
ya     DB 0

caracter DB 'o$'     
pared db "#$" 
pox db 1
poy db 1



.code 
.startup


mov ax, @data
mov ds, ax 

                                                     
   mov  ah,02h
   mov  bh,00h
   mov  dh,5
   mov  dl,5
   int  10h
   mov  ah,09h
   lea  dx,msg
   int  21h
   mov  ah,01h
   int  21h  
   
   
   
   mov  car,al
   mov  ah,03h
   mov  bh,00h
   int  10h
   mov  posx,ch
   mov  posy,dh
   dec  posx
   mov  ah,05h
   mov  al,01h
   int  10h
   
bucle: 
   mov  ah,02h
   mov  bh,01h
   mov  dh,ya
   mov  dl,xa
   int  10h
   mov  ah,02h
   mov  dl,32
   int  21h
   mov  ah,02h
   mov  bh,01h
   mov  dh,posy
   mov  dl,posx
   int  10h
   mov  ah,02h
   mov  dl,car
   int  21h
   mov  ah,02h
   mov  bh,01h
   mov  dh,posy
   mov  dl,posx
   int  10h
   mov  xa,dl
   mov  ya,dh
   mov  ah,00h
   int  16h 
   cmp  ah,75
   jnz  noleft
   
   cmp posx, 1
   je bucle  
   
   
   
   
    mov ax,data
    mov ds,ax
    
    ;---------------------------------------------     

mov pox, 0
mov poy, 0          
superior:

    mov ah, 02h
    mov dh, poy
    mov dl, pox
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc pox
    
    cmp pox, 35
    jne superior
         
mov pox, 0
mov poy, 10
         
inferior:

    mov ah, 02h
    mov dh, poy
    mov dl, pox
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc pox
    
    cmp pox, 35
    jne inferior   
    
    
mov pox, 0
mov poy, 0

lateral1:

    mov ah, 02h
    mov dh, poy
    mov dl, pox
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc poy
    
    cmp poy, 10
    jne lateral1
    
mov pox, 34
mov poy, 0

lateral2:

    mov ah, 02h
    mov dh, poy
    mov dl, pox
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc poy
    
    cmp poy, 10
    jne lateral2   


;------------------------------------------------




     
   dec  posx
   jmp  bucle
   
noleft:    
   cmp  ah,72
   jnz  nodown
   
   cmp posy, 1
   je bucle
   
   dec  posy
   jmp  bucle
   
nodown:
   cmp  ah,77
   jnz  noright
   
   cmp posx, 33
   je bucle  
    
   inc  posx
   jmp  bucle
   
noright:   
   cmp  ah,80   
   jnz  noup
     
   cmp posy, 9
   je bucle 
   
   inc  posy
   jmp  bucle

noup:  
   cmp  al,27 
   
   ;jz   fin
   jmp  bucle 
   


fin:
   mov  ah,4ch
   mov  al,00h
   int  21h

mov ax,035
mov ds, ax

end