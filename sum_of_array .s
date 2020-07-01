.data
array :.space 1024
msg: .asciz "please enter the size of the string "
msg2: .asciz "please enter the value "
outputmsg:.asciz "the sum of the integers inside the array =\n"
newline: .asciz "\n"
.text
.globl main

main:

la s0,array


#displaying msg
la a0,msg
li a7, 4
ecall

la a0,newline
li a7, 4
ecall
#enter the size of the array 
li a7,5 
ecall
mv t1,a0

#entering the value of the array 
li t2,0
loop:
beq t1,t2,exitloop 
#displaying msg
la a0,msg2
li a7, 4
ecall
la a0,newline
li a7, 4
ecall
#entering the data of the array 
li a7,5
ecall

sw a0,0(s0)
addi s0, s0,4
addi t2,t2,1
j loop
exitloop:

la s0,array #giving the addess again to s0 because it changes in the prev loop
jal ra, sum1
mv t3,a0
#displaying output msg 
la a0,outputmsg
li a7, 4
ecall
#printing the value of the sum
mv a0,t3
li a7,1
ecall
li a7,10
ecall
########################################################################

#the function
sum1:
li t2,0
li t3,0
loop2:
beq t2,t1,exitsum1
lw t4,0(s0)
add t3,t4,t3     #the sum
addi s0,s0,4
mv a0, t3
addi t2,t2,1
j loop2
exitsum1:
ret











