
mov ax, 0xb800
mov es, ax

mov bx, 1
mov cx, 100
and ax, 0

calc:
  mov dx, bx
  add ax, dx
  inc bx
loop calc

mov bx, 10
mov cx, 4
mov di, 8

print:
  and dx, 0
  div bx

  sub di, 2
  add dl, 0x30

  mov es:[di], dl
  mov byte es:[di + 1], 0x04
loop print

jmp short $
times	510 - ($ - $$) db	0
dw 0xAA55
