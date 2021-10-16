jmp near start

text db '1',0x07,'+',0x07,'2',0x07,'+',0x07,'.',0x07,'.',0x07,'.',0x07,\
'+',0x07,'1',0x07,'0',0x07,'0',0x07,'=',0x07
start:
  mov ax, 0x07c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  cld
  mov si, text
  mov di, 0
  mov cx, start - text
  rep movsb

  mov cx, 100
  and ax, 0

  calc:
    add ax, cx
  loop calc

  mov bx, 10

  divide:
    and dx, 0
    div bx

    add dl, 0x30
    inc cx
    push dx
    cmp ax, 0
  jnz divide

  print:
    pop ax
    mov es:[di], al
    mov byte es:[di+1], 0x07
    add di, 2
  loop print

  jmp short $
  times	510 - ($ - $$) db	0
  dw 0xAA55
