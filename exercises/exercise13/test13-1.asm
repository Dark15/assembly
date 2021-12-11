
mov dx,0x3d4
mov al,0x0e
out dx,al

mov dx,0x3d5
in al,dx         ; 读取光标位置的高8位值
mov ah,al

mov dx,0x3d4
mov al,0x0f
out dx,al
mov dx,0x3d5
in al,dx        ; 读取光标位置的低8位值 
mov bx,ax

mov bl,80       ;回到行开头
add bx,80+40   ;换行,居中

; 以下设置当前光标位置到居中
mov dx,0x3d4
mov al,0x0e
out dx,al
mov dx,0x3d5
mov al,bh
out dx,al

mov dx,0x3d4
mov al,0x0f
out dx,al
mov dx,0x3d5
mov al,bl
out dx,al   

mov ax, 0xb800
mov es,ax
mov ax,0x07c0
mov ds,ax
mov si,msg
mov cx,11
shl bx,1    ;得到实际在显存的位置

show:
  mov al,[si]
  inc si
  mov ah,0x07
  mov [es:bx],ax
  add bx,2
loop show
    
jmp short $

msg db 'Hello,World'
times 510-($-$$) db 0
dw 0xAA55
