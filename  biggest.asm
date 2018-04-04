
;biggest

;reg b has the first number, reg c has the second
;I move the first number into reg a so that I can compare reg c to the accumulator
;if reg a (AKA: reg b) is smaller, the carry flag is called, and the value in reg c is moved into reg d
;if the carry flag isn't called then it is either the same number or it is bigger so it is moved to reg d either way


jmp start

;data


;code
start: nop

mvi b, 09h
mvi c, 09h

mov a, b

cmp c
jc regCbigger
mov d, b
jmp end

regCbigger: mov d, c
jmp end

end: hlt