.model small
.data
msg db 10,13, "INGRESA PALABRA(ENTER PARA AVANZAR):$"
msg2 db 10,13, "EL TOTAL DE VOCALES ES   $"
msg3 db 10,13, "EL TOTAL DE CONSONANTES SON  $"
msg5 db 10,13, "ERROR WEY!!! $"

letra dw ?
letra1 dw ?

.code 
    mov ax, @data 
    mov ds, ax
    mov ah, 09h ;para imprimir en pantalla
    lea dx, msg
    int 21h
    
    mov bx, 0
    mov letra, 0
    mov letra1, 0
    
    
 ciclo:
    mov ah, 01h
    int 21h
    cmp al, 13 ;13 (salto de linea) es equivalente a enter      
    je final
    
    cmp  al,097 
    jl error     ;jl salta si es menor a 097
    cmp al, 122
    jg error     ;jg salta si es mayor a 122
    
    
    cmp  al,097 ;a
    je vocal   
    cmp  al,101 ;e
    je vocal
    cmp  al,105 ;i
    je vocal
    cmp  al,111 ;o
    je vocal
    cmp  al,117 ;u
    je vocal
    
    
    cmp al, 098    ;de b
    jge consonante
    cmp al, 100    ;hasta d
    jle consonante
    cmp al, 102    ;de f
    jge consonante
    cmp al, 104    ;hasta h
    jle consonante
    cmp al, 106    ;de j
    jge consonante
    cmp al, 110    ;hasta n
    jle consonante
    cmp al, 112    ;de p
    jge consonante
    cmp al, 116    ;hasta t
    jle consonante 
    cmp al, 118    ;de v
    jge consonante
    cmp al, 122    ;hasta z
    jle consonante
    
    mov ah, 0
    
    
    jmp ciclo 


vocal:
    inc letra
    jmp ciclo

consonante: 
    inc letra1
    jmp ciclo
    
error:  
    mov ah, 9h  
    lea dx,msg5
    int 21h
    jmp terminar

final:   
   mov ah,9h      
   
   lea dx,msg2
   int 21h 
   
   mov dx, letra
   add dl, 48 
   mov ah, 02h
   int 21h     
   
   lea dx,msg3
   mov ah, 09h
   int 21h     
   
   mov dx, letra1
   add dl, 48 
   mov ah, 02h
   int 21h
   
terminar:
   
   mov ax,4c00h
   int 21h
   


end