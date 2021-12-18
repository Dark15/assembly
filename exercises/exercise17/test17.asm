and si, 0
and di, 0

clock:
  and ax, 0
  int 0x1A
  inc si
  cmp si, 18
  jb clock

  mov ah, 0x0e
  mov al, 'A'
  int 0x10
  xor si, si
  inc di
  cmp di, 10
  jb clock

jmp near $

times 510 - ($ - $$) db 0
dw 0xAA55
