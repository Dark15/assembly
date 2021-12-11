jmp near start
text: db 'Hello World'
start: 
  mov ah, 0x03
  and bh, 0
  int 0x10

  inc dh
  mov dl, 80 / 2
  mov ah, 0x02
  and bh, 0
  int 0x10

  mov cx, start - text
  mov si, 0x7c0
  mov ds, si
  mov si, text

  print:
    mov ah, 0x0e
    mov al, [si]
    inc si
    int 0x10
  loop print

times 510 - ($ - $$) db 0
dw 0xAA55
  