hello_sector equ 100

mov ax, 0xb800
mov es, ax

and di, 0

mov dx, 0x1f2
mov al, 2
out dx, al

inc dx
mov al, hello_sector
out dx, al

inc dx
and al, 0
out dx, al

inc dx
out dx, al

inc dx
mov al, 0xe0
out dx, al

inc dx
mov al, 0x20
out dx, al

waits:
  in al, dx
  and al, 0b1000_1000
  cmp al, 0x08
jnz waits

mov cx, 512
mov dx, 0x1f0

readw:
  in ax, dx

  cmp al, 0
  jnz printw_low
  jz check_high

  printw_low:
    mov [es:di], al
    inc di
    mov byte [es:di], 0x07
    inc di

  check_high: cmp ah, 0
  jnz printw_high
  jz end_loop

  printw_high:
    mov [es:di], ah
    inc di
    mov byte [es:di], 0x07
    inc di

  end_loop: dec cx
  cmp cx, 0
ja readw



  

times 510 - ($ - $$) db 0
dw 0xAA55