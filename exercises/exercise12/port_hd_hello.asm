			;文件名：port_hd_hello.asm
			;功能：1.读取硬盘逻辑扇区号100处的1个扇区到物理内存0x10000处
			;      2.并显示扇区开头的‘hello'
			;	   3.MBR程序
			;目的：练习对硬盘的端口访问
			;说明：本末终始2020-11-24，参考李忠c08_mbr.asm
			app_lba_start equ 100		;'hello'在第100扇区(LBA)
SECTION hello align=16 vstart=0x7c00
			;设置堆栈段和栈指令
			xor ax,ax
			mov ss,ax
			mov sp,ax
			
			;设置DS和ES
			mov ax,0x1000				;0x10000的段地址，接收扇区来的数据
			mov ds,ax
			mov es,ax
			
			;调用call及参数设置：扇区号和装载内存偏移地址
			xor di,di
			mov si,app_lba_start		;di:si：逻辑扇区号100
			xor bx,bx					;装载扇区的内存区偏移地址0
			call read_hard_disk_0		;从硬盘读取一个逻辑扇区，到DS:BX（内存0x10000）。引自李忠c08_mbr.asm
			
			;显示'hello'5个字符到0xb8000
			mov ax,0xb800
			mov es,ax
			xor si,si
			xor di,di
			mov cx,5					;显示'hello'5个字符
disp:
			mov al,[si]
			mov ah,0x07
			mov [es:di],ax
			inc si
			inc di
			inc di
			loop disp
			
			jmp $						;程序结束
			
;-----------------------------------------------------------------------------

read_hard_disk_0:                        ;从硬盘读取一个逻辑扇区
                                         ;输入：DI:SI=起始逻辑扇区号
                                         ;      DS:BX=目标缓冲区地址
			 push ax						;过程中使用，端口数据
			 push bx						;过程中使用，退出后需恢复
			 push cx						;过程中使用，计数
			 push dx						;过程中使用，端口号
		  
			 mov dx,0x1f2
			 mov al,1
			 out dx,al                       ;读取的扇区数

			 inc dx                          ;0x1f3
			 mov ax,si
			 out dx,al                       ;LBA地址7~0

			 inc dx                          ;0x1f4
			 mov al,ah
			 out dx,al                       ;LBA地址15~8

			 inc dx                          ;0x1f5
			 mov ax,di
			 out dx,al                       ;LBA地址23~16

			 inc dx                          ;0x1f6
			 mov al,0xe0                     ;LBA28模式，主盘
			 or al,ah                        ;LBA地址27~24
			 out dx,al

			 inc dx                          ;0x1f7
			 mov al,0x20                     ;读命令
			 out dx,al

	  .waits:
			 in al,dx
			 and al,0b1000_1000				;BSY:1--硬盘忙,DRQ:1--准备好
			 cmp al,0x08
			 jnz .waits                      ;不忙，且硬盘已准备好数据传输 
											;BSY:0--不忙,DRQ:1--准备好

			 mov cx,256                      ;总共要读取的字数，一个扇区
			 mov dx,0x1f0
	  .readw:
			 in ax,dx
			 mov [bx],ax
			 add bx,2
			 loop .readw

			 pop dx
			 pop cx
			 pop bx
			 pop ax
		  
			 ret			
			
;--------------------------------------------------------------------------------
			times 510-($-$$) db 0
			db 0x55,0xaa 
			
			