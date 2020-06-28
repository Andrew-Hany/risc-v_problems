.data 
multiplicationmsg:.asciz "    		THIS IS MULTIPLICATION CALCULATOR \n\n"
first_msg: .asciz "please enter the first number\n"
sec_msg: .asciz "please enter the second number\n"
final:.asciz "Multi = \n"
.text 
.globl main
main:
li a7, 4
la a0,multiplicationmsg
ecall

li a7, 4
la a0,first_msg
ecall

li a7, 5 
ecall
mv s0,a0

bge s0,zero, exit  #-1>=0
neg s1,s0
exit:
li a7, 4
la a0,sec_msg
ecall


li a7, 5 
ecall
mv s2,a0

bge s2,zero, exit2  #-1>=0
neg s2,s2

exit2:
#s0 is the first unsign integer
#s2 is the second unsigned integer

addi t0,zero, 32 # intializing the counter
addi t1,zero, 0 #the product 
addi t3,zero, 1 #contains one
loop:

andi t2,s2, 1 # s3 & 000...1

bne  t2,t3, jumb
add t1, t1, s0
jumb:

slli s0, s0, 1
srai  s2, s2, 1
addi t0,t0,-1
beqz t0,exit3 
j loop

exit3:
li a7, 4
la a0,final
ecall
mv a0,t1



li a7,36
ecall

