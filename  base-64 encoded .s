.data
str:.space 1024
newline: .asciz "\n"
inputmsg:.asciz " please enter the string: \n"
outputmsg:.asciz " base-64 encoded string: \n"
ASC: .byte    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/'

.text
.globl main
main:

la s0,ASC

#input message
li a7,4
la a0,inputmsg
ecall



#input string
li a7,8
la a0, str
li a1,1024
ecall
mv s1,a0

#newline
li a7,4
la a0, newline
ecall
li a7,4
la a0,outputmsg
ecall

convert:
#converting 3 characters to 4 characters base64
lb t0,0(s1)  #first character
lb t1,1(s1)  #second character
lb t2,2(s1)  #third character
beqz t0, exit 
beqz t1, exit 

#working on first character
andi t3,t0,3    # t0 &000...11 will result on 0000...00??
slli t3,t3,4

srai t0,t0,2 

  

add t0,t0,s0
lb t0,0(t0)

#printing base-64 chars
li a7, 11
mv a0,t0
ecall 

#working on second character
andi t4,t1,15    # need new variabel because it will use the previous one
slli t4,t4,2

srai t1,t1,4 
add t1,t1, t3
  


add t1,t1,s0
lb t1,0(t1)

#printing base-64 chars
li a7, 11
mv a0,t1
ecall 
beqz t2, exit 
#working on third character
andi t5,t2,63    # need new variabel because it will use the previous one
slli t5,t5,0

srai t2,t2,6
add t2,t2, t4
  

add t2,t2,s0
lb t2,0(t2)

#printing base-64 chars
li a7, 11
mv a0,t2
ecall 

#printing the 4th char in base-64




add t5,t5,s0
lb t5, 0(t5)




li a7, 11
mv a0,t5
ecall

addi s1,s1,3

j convert 
#exit
exit:
li a7,10
ecall










