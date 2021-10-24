jmp near start

text: db '1',0x07,'+',0x07,'2',0x07,'+',0x07,'.',0x07,'.',0x07, \
'.',0x07,'+',0x07,'1',0x07,'0',0x07,'0',0x07,'0',0x07,'=',0x07
ten: dw 10

start:
  mov ax, 0x7c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  cld
  mov cx, ten - text
  mov si, text
  and di, 0
  rep movsb

  and ax, 0
  and dx, 0
  mov cx, 1000

  calc_sum:
    add ax, cx
    adc dx, 0
  loop calc_sum

  divide:
    div word [ten]
    push dx
    inc cx  
    and dx, 0
    cmp ax, 0
  ja divide

  print_result:
    pop dx
    add dx, 0x30
    mov [es:di], dx
    inc di
    mov byte [es:di],0x07
    inc di
  loop print_result

jmp short $
times 510 - ($ - $$) db 0
dw 0xAA55
