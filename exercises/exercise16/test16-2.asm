input:
  and ax, 0
  int 0x16

  cmp al, 32
  jne output
  mov al, ' '

output:
  mov ah, 0x0e
  int 0x10
  jmp input

times 510 - ($ - $$) db 0
dw 0xAA55