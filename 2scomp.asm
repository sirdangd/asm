
;2scomp

;if the left most bit is 1, then it is negative and
;needs to be changed to positive

;to make it positive, the number should be 
;subtracted by 1 then everything should be 
;complimented

;if the left most bit is still 1, then there is
;overflow

;if there is overflow, reg bc will say dead

;result is stored in reg b

jmp start

;data


;code
start: nop
mvi a, 0b3h
mov c, a
rlc
jc comp ;to check if it is negative or not
jmp end
comp: mov a, c
dcr a ;-1
cma ;compliment
mov c, a
rlc
jc overflow ;if left most bit is still 1 then it has overflow
jmp end

overflow: lxi b, 0deadh
jmp done
end: mov b, c


done: hlt