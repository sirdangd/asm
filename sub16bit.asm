
;sub16bit

;the first number is stored in reg bc
;the second number is stored in reg de

;the 8 bits from reg c are subtracted by the 8 bits in reg e
;the 8 bits from reg b are subtracted by the 8 bits in reg d
;sbb is used for the second subtraction isntead of sub because what is being subtracted is reg d and also whatever is in the borrow flag

jmp start

;data


;code
start: nop

lxi b, 1010h
lxi d, 0101h

mov a, c
sub e
mov l, a

mov a, b
sbb d
jm overflow
mov h, a
jmp end

overflow: lxi h, 0deadh
;mvi h, 0deh
;mvi l, 0adh


end: hlt