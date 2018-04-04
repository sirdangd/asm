
;odd even

;the value we are checking is in reg a
;reg b is 00h so that it can be compared to reg a each time to see if it is the same or not
;if reg a becomes negative, it will jump to the odd label and make reg c equal 0Fh
;if reg a becomes 0, it will jump to even making reg c 00h
;in the loop (decreaseReg:), reg a is subtracted by 2 each time

jmp start

;data


;code
start: nop

mvi a, 06h 
mvi b, 00h  
cmp b
jz even
decreaseReg: sui 02h 
jm odd
cmp b
jz even
jp decreaseReg 
odd: mvi c, 00h
jmp end
even: mvi c, 0fh

end: hlt