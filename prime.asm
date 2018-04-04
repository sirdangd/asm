
;prime

;first thing I check is if the number in reg b is 1 or 2 because those are prime numbers

;in my loop, I subtract the number in 
;reg b (which will be in reg a for the loop) 
;by the value in reg d which will start 
;at 2 (not one because it is already known 
;that it will be divisible by 1) and it keeps 
;going until it reaches 0 or some negative number. 
;If it reaches 0, then it is not prime, although 
;if it reaches a negative number, d is 
;incremented by one, reg a is set back 
;to the value of reg b and a check is done to 
;see if reg a and d are the same or not because 
;if it is the same then it is a prime number 
;as it will of course be divisible by itself

;if it is prime, I store 01h in reg c, otherwise it'll store 00h

jmp start

;data


;code
start: nop

mvi b, 015h
mov a, b
cpi 02h
jz prime 
cpi 01h
jz notprime
cpi 00h
jz notprime
mvi d, 02h

loop: sub d 
jz notprime ;if reg a - reg d = 0 then it isn't prime
jp loop ;as long as reg a positive, reg a will keep being subtracted by reg d
inr d 
mov a, b 
cmp d ;reg d keeps increasing and loop keeps going on until reg a = reg d
jz prime ;if they are equal, it is a prime number
jmp loop

prime: mvi c, 01h
jmp end

notprime: mvi c, 00h

end: hlt