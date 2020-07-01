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
mv a1,s0

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
mv a0,t1
jal ra ,sum2

li a7 ,1
ecall 
li a7 ,10
ecall 


#---------------------------------------------------------
#recursion
sum2:
bne a0,zero, recurse 
ret 

recurse:
 
  addi sp,sp,-8
  sw ra,0(sp)

  
   
  
    lw t4,0(a1)
     sw t4, 4(sp) 
    addi a1,a1,4
   addi a0, a0, -1
   jal sum2
  
   lw t3,4(sp)
    
   li a7, 1
   ecall
   add a0,a0,t3
   
    lw ra, 0(sp)
   addi sp,sp,8
   ret
   






