mov ax,0xb800
mov ds,ax

mov byte [0],'h'
mov byte [2],'e'
mov byte [4],'l'
mov byte [6],'l'
mov byte [8],'o'

jmp $
times 510-($-$$) db 0

db 0x55,0xaa
