
jmp near start

text db 'L',0x07,'a',0x07,'b',0x07,'e',0x07,'l',0x07,' ',0x07,'o',0x07,\
'f',0x07,'f',0x07,'s',0x07,'e',0x07,'t',0x07,':',0x07

start:
  mov ax, 0x07c0
  mov ds, ax

  mov ax, 0xb800
  mov es, ax

  cld ;将Direction Flag设置为0，表示从低地址到高地址
  mov si, text ;si指向text指向的内存地址
  mov di, 0 ;设置输出的起始地址
  mov cx, 13 ;设置要显示的字符个数
  rep movsw ;将text中的字符复制到屏幕的第0行的第0列开始的位置

  jmp short $

  times 510 - ($ - $$) db 0
  dw 0xAA55
