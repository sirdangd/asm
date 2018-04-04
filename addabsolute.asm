
;addabsolute
;check if both regs are negative or not
;if they are I make them positive and check for overflow
;once they are checked and turned to positive where needed, I add both of them and store the sum in reg d
;if one of the reg's have over flow, I put DEAD in reg hl

jmp start

;data


;code
start: nop
mvi b, 0b3h
mvi c, 0a2h

mov d, b
mov a, b
rlc
jc comp1 ;checking if reg b is negative or not
jmp checkc ;if not then check reg c
comp1: mov a, d 
dcr a
cma
mov b, a
rlc
jc overflow
checkc: mov e, c
mov a, c
rlc
jc comp2 ;if reg c is negative, make it positive
jmp addnum ;if not, add the number
comp2: mov a, e
dcr a
cma
mov c, a
rlc
jc overflow
addnum: mov a, b
add c
mov d, a
rlc
jc overflow ;if the leftmost bit is 1, there is overflow
jmp end
overflow: lxi h, 0deadh

end: hlt