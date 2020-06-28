.data 

ask : .asciz " please enter a paragraph its letters lowercase: \n\n"
output : .asciz "the first letter of the each word will be capitalized: \n\n"
string: .space 1024
space: .byte ' '

.text
.globl main
main:

li a7, 4 
la a0, ask 
ecall



li a7 , 8 
la a0, string
li a1, 1024
ecall
mv t0, a0 #has a copy of the input string 
li a7, 4 
la a0, output 
ecall


la s1, space  #space 


lb t1, 0(t0)
addi t1,t1,-32
li a7, 11
mv a0, t1
ecall
addi t0,t0,1


loop:
lb t1, 0(t0)
lb t6,(s1)

beqz t1,exit
beq t1,t6,change




li a7, 11
mv a0, t1
ecall


 
addi t0,t0,1

j loop


change:
li a7, 11
mv a0, t1
ecall
addi t0,t0,1
lb t1, 0(t0)
addi t1,t1,-32
li a7, 11
mv a0, t1
ecall
addi t0,t0,1

j loop



exit:
li a7, 10
ecall


