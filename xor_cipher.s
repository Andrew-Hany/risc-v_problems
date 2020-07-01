.data 
msgs:.asciz "Enter the text you want to decrypt:\n"
msgp:.asciz "enter the pass\n"
msgd:.asciz "the text after dycryption\n"
msge:.asciz "the text after encryption\n"
str:.space 1024
newline:.asciz "\n"
pass:.space 1024

.text
.globl main
main:
#input of the text and the pass
la a0, msgs
li a7,4
ecall

la a0,str
li a1, 1024
li a7,8
ecall

la a0, msgp
li a7,4
ecall

la a0,pass
li a1, 1024
li a7,8
ecall

la a0, msgd
li a7,4
ecall
#call the function to encrypt
la a0,str
la a1, pass
jal ra, xor_cipher

la a0, newline
li a7,4
ecall

la a0, msge
li a7,4
ecall
#call the function to decrypt
la a0,str
la a1, pass
jal ra, xor_cipher

li a7,10
ecall

#-------------------------
xor_cipher:
#sum of the pass
addi t0,zero,0
sum:
lbu t1, 0(a1)
add t0,t0,t1

addi a1,a1,1
beqz t1, exit
j sum
exit:
addi t0,t0,-10 #sub the num of the /n
andi t0,t0,255  #the least significant byte 
#---------ecrypting/encrypting---------
mv s0,a0
process:
lb t1,0(s0)
beqz t1,exitP
xor t1, t1,t0
sb t1, 0(s0)
mv a0,t1
li a7 , 11 
ecall
addi s0,s0,1
j process
exitP:
ret












