.model small
 
.data
        a db 12, 24, 36, 48
        sum dw 0
 
.code
        mov ax,@data
        mov ds,ax
        mov cl,4
        xor di,di
        lea bx,a
back:   mov al,[bx+di]
        mov ah,00
        add sum,ax
        inc di
        dec cl
        jnz back
end
