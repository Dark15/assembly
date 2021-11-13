db '1234'
section data1 align=16 vstart=0
  db '5678'
label1: db label1
section data2 align=16
  db 'abcd'
label2: db label2
section data3 align=32 vstart=0
  db 'ABCD'
program_end: db program_end
