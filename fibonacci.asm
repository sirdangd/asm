
;fibonacci

;term is stored in reg d
;answer is shown in reg h

jmp start

;data


;code
start: nop

mvi d, 05h
mov e, d ;counter
mov a, e
cpi 02h
jz term12 ;if reg d is 2, result is 1
jc term12 ;if reg d is 1, result is 1
dcr e
dcr e ;minus two because I am skipping first 2 terms
mvi b, 01h
mvi c, 01h 

loop: mov a, c ;I take the last term which is reg c and make it reg a which is the current term
add b ;add it to reg b
mov b, c
mov c, a
dcr e ;decrease counter by 1
mov a, e 
cpi 00h
jz end
jmp loop

term12: mvi h, 01h
jmp done

end: mov h, c

done: hlt
