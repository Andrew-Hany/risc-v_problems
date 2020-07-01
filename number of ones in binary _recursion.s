.data
msg : .asciz "enter the value and i will count the number of ones in its binary \n"
out:.asciz "number of ones in its binry = \n"
.text
.globl  main
main:


#input 
la a0,msg
li a7,4
ecall

li a7,5
ecall
#handeling the unsigned 
bge a0, zero,exitneg
neg a0,a0


exitneg:
jal ra ,fn1
mv s6, a0
la a0,out
li a7,4
ecall
mv a0,s6
li a7,1
ecall

li a7,10
ecall





#----------------------------
fn1:
bne a0,zero, else 
ret

else:
addi sp,sp,-12
sw ra, 0(sp)
sw a0,4(sp)

andi t1, a0, 1
sw t1,8(sp)
srli a0,a0, 1
jal fn1

lw  t2,8(sp)
add a0,a0,t2

lw ra, 0(sp)
addi sp,sp,12
ret
 
 
 
