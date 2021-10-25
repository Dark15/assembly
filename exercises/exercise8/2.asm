jmp short start

string: db 'abcdefghijklmnopqrstuvwxyz'

start:
  mov ax, 0x7c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  and si, 0
  mov di, 25

  mov bx, string

order:
  mov ah, [bx + si]
  mov al, [bx + di]
  mov [bx + si], al
  mov [bx + di], ah
  inc si
  dec di
  cmp si, di
jl order

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

times 510 - ($ - $$) db 0
dw 0xAA55
