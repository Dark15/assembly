hello_sector equ 100

mov dx, 0x1f2
mov al, 1
out dx, al

inc dx
mov al, hello_sector
out dx, al

inc dx
xor al, al
out dx, al

inc dx
out dx, al

inc dx
mov al, 0xe0
out dx, al

mov dx, 0x1f7
mov al, 0x20
out dx, al
        
waits:
  in al, dx
  and al, 0b1000_1000
  cmp al, 0x08
jnz waits

mov ax, 0xb800
mov es, ax
xor di, di
mov cx, 3
mov dx, 0x1f0

readw:
  in ax, dx
  mov [es:di], al
  inc di
  mov byte [es:di], 0x07
  inc di
  mov [es:di], ah
  inc di
  mov byte [es:di], 0x07
  inc di
loop readw
  
jmp $
times 510 - ($ - $$) db 0
dw 0xAA55
