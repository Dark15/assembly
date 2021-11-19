			;功能：显示CMOS的年月日
			;环境：NASM，Windows
			;命令：in、out、shr
			;版本：V1.0,2018-6-6本末终始
		;设置显示区
		mov ax,0xb800
		mov es,ax
		xor bx,bx
		
		;从CMOS读“年的前两位”,并显示。如：20
		mov al,0x32
		out 0x70,al
		in al,0x71
		mov ah,al		;将两位BCD码分别处理和显示
		shr al,4		;高位
		and ah,0x0F		;低位
		
		add al,0x30
		mov [es:bx],al
		inc bx
		inc bx
		add ah,0x30
		mov [es:bx],ah
		inc bx
		inc bx
		
		;从CMOS读“年的后两位”，并显示。如：18-
		mov al,0x9
		out 0x70,al
		in al,0x71
		mov ah,al		;将两位BCD码分别处理和显示
		shr al,4		;高位
		and ah,0x0F		;低位
		
		add al,0x30
		mov [es:bx],al
		inc bx
		inc bx
		add ah,0x30
		mov [es:bx],ah
		inc bx
		inc bx
		mov byte [es:bx],'-'
		inc bx
		inc bx
		
		;从CMOS读“月”，并显示。如：06-
		mov al,0x8
		out 0x70,al
		in al,0x71
		mov ah,al		;将两位BCD码分别处理和显示
		shr al,4		;高位
		and ah,0x0F		;低位
		
		add al,0x30
		mov [es:bx],al
		inc bx
		inc bx
		add ah,0x30
		mov [es:bx],ah
		inc bx
		inc bx
		mov byte [es:bx],'-'
		inc bx
		inc bx
		
		;从CMOS读“日”，并显示。如：07
		mov al,0x7
		out 0x70,al
		in al,0x71
		mov ah,al		;将两位BCD码分别处理和显示
		shr al,4		;高位
		and ah,0x0F		;低位
		
		add al,0x30
		mov [es:bx],al
		inc bx
		inc bx
		add ah,0x30
		mov [es:bx],ah
		inc bx
		inc bx
		
		;终止。死循环
		jmp near $
		times 510-($-$$) db 0
		db 0x55,0xaa
		
		
