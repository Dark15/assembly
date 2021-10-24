jmp near start 

data1: db 0x05, 0xff, 0x80, 0xf0, 0x97, 0x30
data2: dw 0x90, 0xfff0, 0xa0, 0x1235, 0x2f, 0xc0, 0xc5bc

start: 
  mov ax, 0x7c0
  mov ds, ax
  mov ax, 0xb800
  mov es, ax
  mov cx, data2 - data1
  mov si, data1
  and di, 0

check_data1:
  cmp byte [si], 0
  call print
  inc si
loop check_data1

mov cx, (start - data2) / 2

check_data2:
  cmp word [si], 0
  call print
  add si, 2
loop check_data2

jmp $

print:
  mov al, 0x30
  jg short print_end
  inc al

print_end:
  mov [es:di], al
  inc di
  mov byte [es:di], 0x07
  inc di
  ret

times 510 - ($ - $$) db 0
dw 0xAA55
