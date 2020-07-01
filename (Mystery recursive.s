#when calling this mystery_fn(10), the output will be 55 (10+9+8+7+6+5+4+3+2+1)




.data 
msg : .asciz "enter a number\n"
msgo : .asciz "the output is \n"

.text
.globl main
main:
#input
la , a0,msg
li a7, 4
ecall
li a7 5
ecall


jal ra mystery_fn
mv s4, a0
la , a0,msgo
li a7, 4
ecall
mv a0,s4
li a7,1 
ecall
li a7, 10
ecall


#---------------------------------
mystery_fn:
bne a0,zero, else 
ret
else:

addi sp,sp,-8

sw ra, 0(sp)
sw a0, 4(sp)

addi a0,a0,-1
jal mystery_fn


lw t1, 4(sp)
add a0,a0,t1

lw ra,0(sp)
addi sp,sp,8
ret


