mov word [data], 0x2008
xor byte [data], 0x05
add word [data], 0x0101
mov ax, [data]
data db 0, 0
jmp $
times 510 - ($ - $$) db 0

db 0x55,0xaa