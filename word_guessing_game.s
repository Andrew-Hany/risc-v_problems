.data
words: .space 100
word1: .asciz "ball\n"
word2: .asciz "plate\n"
word3: .asciz "table\n"
word4: .asciz "mobile\n"
word5: .asciz "laptop\n"
newline: .asciz "\n"
askingForExit:.asciz "\n if you want to exit write '0',if not write '1'\n"
astrix: .asciz "*"
tri:.asciz "st-trail:\n"
congrates:.asciz "congratulations your guess is right\n"
failed: .asciz "the answer is wrong, your have two extra trials\n"
failed2: .asciz "the answer is wrong, your have only one extra trial\n"
trialsend: .asciz "GameOver\n"
rules:.asciz "the rules:\n 1) a word with missing letters will appear on the screen\n 2) you have to guess the word correctly\n 3) after writing the word you have to press enter \n 4) you have only 3 trial \n    do your best :)"
input: .word 1024

.text 
.globl main
main:

la s0,words
la t1,word1
la t2,word2
la t3,word3
la t4,word4
la t5,word5
#storing the 5 words in the array 
sw t1, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
sw t5, 16(s0)
#rules 
li a7, 4
la a0, rules
ecall
#chosing random word from the array 
randnum:
li a1, 17
li a7,42
ecall 
mv t4,a0


#new line
li a7 , 4
la a0 , newline
ecall

andi t3,t4,3 #t4 & 0000..11
beqz t3 ,exitR
j randnum
exitR:
#load the random word from the array
add s0,s0,t4
lw s2,0(s0)
mv t6,s2

#size of the word
addi s3,zero,0
size:
lb t2,0(s2)  #letters of the randomed word
addi s2,s2,1
addi s3,s3,1
beqz t2,exitS
j size
exitS:
addi s3,s3,-2


mv s2,t6
#replacing three letter  by "*" 
#generating 3 random number 
add a1,zero, s3
li a7,42
ecall 
mv t3,a0


#check if it is equal the first random one or not 
check1:
add a1,zero, s3
li a7,42
ecall 
mv t4,a0
bne t4,t3,exitC1
j check1
exitC1:

#check if it is equal the first and second random one or not
check2:
add a1,zero, s3
li a7,42
ecall 
mv t5,a0
bne t5,t3,exitC2
bne t5,t4,exitC2
j check2
exitC2:



addi t1,zero,0 #counter
rep:


lb t2,0(s2)  #letters of the randomed word
beq t1,t3,printa
beq t1,t4,printa
beq t1,t5,printa

li a7,11
mv a0,t2
ecall

beq zero,zero,exitprint 

printa:
li a7,4
la a0,astrix
ecall
exitprint:

addi s2,s2,1

addi t1,t1,1
lb t2,0(s2)
beqz  t2,exitrep
j rep
exitrep:
#new line
li a7 , 4
la a0 , newline
ecall
mv s2,t6
#loop till the trail end
addi s7,zero,0 #counter
addi s6,zero , 3
addi s5,zero , 2

trail:
addi s7,s7,1
li a7, 1
mv a0,s7
ecall
li a7, 4
la a0, tri
ecall 
#input (the guess)
li a7, 8
la a0, input
li a1, 1024
ecall
mv s1,a0
mv t5,s1
#new line
li a7 , 4
la a0 , newline
ecall


#comparing the word  with the input 
comp:
lb t1,0(s1)  #letters of the input 
lb t2,0(s2)  #letters of the randomed word
bne t1, t2, fail
addi s1,s1,1
addi s2,s2,1
beqz t1,printCong
beqz t2,printCong
j comp

fail:
beq s7,s5,fail2
beq s7,s6, trialsended
#printing failed message
fail1:
li a7 , 4
la a0 , failed
ecall
beqz zero,con
#printing failed message2
fail2:
li a7 , 4
la a0 , failed2
ecall
con:
mv s1,t5 #making the value of s1 return back to its intial value
mv s2,t6 #making the value of s2 return back to its intial value

#asking for exit 
li a7,4
la a0,askingForExit
ecall

li a7, 5
ecall
beqz a0,exit
addi t1,t1,1

beq a0,t1,trail
j trail

#trailsended msg
trialsended:
li a7 , 4
la a0 , trialsend
ecall
beqz zero,exit 
#printing success message

printCong:
li a7 , 4
la a0 , congrates
ecall
#exit 
exit :
li a7 ,10
ecall



