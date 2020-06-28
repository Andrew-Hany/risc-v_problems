
.data
inputmsg:.asciz "please enter a string :\n"
newline: .asciz "\n"
msg_size:.asciz "the size of the string is : \n"
reversedmsg:.asciz "the reversed string :"
char: .byte 'a'
input : .space 256
output:.space  256
 	.text
	
	.globl main
main:
li a7, 4
la a0, inputmsg
ecall


la a0, input
li a1, 256

li a7, 8
ecall



mv t0, a0 #has a copy of the input string 


li t1,0 # intializing the counter 

cal_size:
lb t2, 0(a0) #loading every character into the t2
beqz t2,print_size #checking for the null character
addi a0,a0,1      #else increment a0 by one
addi t1,t1,1      #increment the counter (t1) by one
j cal_size


print_size:
li a7, 4
la a0, msg_size
ecall



li a7, 1
addi t1,t1,-1  #decrement the counter by one 
mv a0, t1 #moving the counter to the a0 which will be printed
ecall

li a7,4
la a0,newline
ecall


li a7, 4
la a0, reversedmsg
ecall

mv t3, t0
# we have a copy of the string in t3, t0 and the size in t1

add t3, t3, t1

reversing :

lb t5, 0(t3)
li a7, 11
mv a0, t5
ecall
ble t3, t0, exit 
addi t3,t3,-1
j reversing
exit :
li a7, 10
ecall





 

	




li a7, 10
ecall
