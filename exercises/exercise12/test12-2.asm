hello_sector equ 100

mov si, 0x7c0
mov ds, si
xor si, si

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

inc dx
mov al, 0x30
out dx, al

waits:
  in al, dx
  and al, 0b1000_1000
  cmp al, 0x08
jnz waits      

mov cx, 256
mov dx, 0x1f0
mov si,text

writew:
  mov ax, [si]
  out dx, ax
  add si, 2
loop writew

jmp $
text db 'world'
times 510-($-$$) db 0 
dw 0xAA55
