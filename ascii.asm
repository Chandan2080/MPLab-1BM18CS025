.model small
 
.data
        msg1 db 0dh,0ah,"Enter a alphanumeric charecter...$"
        res db 02 dup(0)
 
.code
        mov ax,@data
        mov ds,ax
        LEA dx,msg1
        call disp
        mov ah,01h
        int 21h
        mov bl,al
        mov cl,4
        shr al,cl
        cmp al,0ah
        jc digit
        add al,07
       
digit:  add al,30h
        mov res,al
        and bl,0fh
        cmp bl,0ah
        jc digit1
        add al,07
       
 
digit1:
        add bl, 03h
        mov res+1, bl
        mov al, 00h
        mov al, 03h
        int 10h
        mov al,02h
        mov bl,00h
        mov dl,0ch
        int 10h
        mov res+2,'$'
        LEA dx,res
        call disp
        mov al,4ch
        int 21h
       
disp proc near
mov ah,09h
int 21h
ret
disp endp
end
