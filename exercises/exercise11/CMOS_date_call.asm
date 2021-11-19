mov ax, 0xb800
mov es, ax

and di, 0

; Century
mov al, 0x32
out 0x70, al
in al, 0x71
call read_CMOS_disp

; Year
mov al, 0x9
out 0x70, al
in al, 0x71
call read_CMOS_disp

call print_dash

; Month
mov al, 0x8
out 0x70, al
in al, 0x71
call read_CMOS_disp

call print_dash

; Day
mov al, 0x7
out 0x70, al
in al, 0x71
call read_CMOS_disp

jmp $

read_CMOS_disp:
  and ah, 0

  push dx
  
  mov dl, al
  and dl, 0xf
  add dl, 0x30
  shr al, 4
  add al, 0x30
  mov [es:di], al
  inc di
  mov byte [es:di], 0x07
  inc di
  mov [es:di], dl
  inc di
  mov byte [es:di], 0x07
  inc di

  pop dx
  ret

print_dash:
  mov byte [es:di], 0x2d
  inc di
  mov byte [es:di], 0x07
  inc di
  ret

times 510 - ($ - $$) db 0
dw 0xAA55
