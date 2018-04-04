
;gcd

;first thing I do is check whether they are the 
;same number or not, if they are, then I just result
;whatever is in reg a

;then I check if reg b is greater than reg a, if it
;is, I switch the two to avoid confusion 

;once that is all done, I begin my loop which subtracts
;reg a to reg b until it is negative or zero
;if it is zero, then the value of reg b is the gcd
;if it becomes negative, I add reg a to reg b just 
;once and switch the two values so that whatever is
;in reg a will be subtracting whatever is in reg b
;and that will give us the answer as to what the 
;gcd is

;the value of the gcd is stored in reg d

jmp start

;data


;code
start: nop
mvi a, 015h
mvi b, 09h

mov e, b
cpi 00h
jz zero
mov c, b
mov e, a 
mov a, b 
cpi 00h
jz zero 
mov b, a
mov a, d

cmp b
jc switch ;if reg b > reg a
jz same ;if reg a = reg b
jmp loop ;else jump to loop

switch: mov c, a
mov a, b
mov b, c

loop: sub b ;keep subtracting until value is -tve or +tve
jz done
jp loop
add b

mov c, a ;switching values of reg a and b
mov a, b
mov b, c

jmp loop

zero: mov d, e
jmp end

same: mov d, a
jmp end

done: mov d, b

end: hlt