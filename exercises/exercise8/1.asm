jmp near start

string: db 'abcdefghijklmnopqrstuvwxyz'

start:
  mov ax, 0x7c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  mov cx, 26
  mov bx, string

lppush:
  mov al, [bx]
  push ax
  inc bx
loop lppush

mov cx, 26
mov bx, string

lppop:
  pop ax
  mov [bx], al
  inc bx
loop lppop

mov si, string
and di, 0
mov cx, 26

print:
  mov al, [si]
  mov byte es:[di], al
  inc si
  inc di
  mov byte es:[di], 0x07
  inc di
loop print

jmp $

times 510 - ($ - $$) db 0
dw 0xAA55
