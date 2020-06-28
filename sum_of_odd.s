.data
firstRange:.asciz " enter first number in the range"
secRange:.asciz " enter sec number in the range"
newline: .asciz "\n"
output:.asciz "the summation of the odd number in the [first number,second number] :\n"
	.text
	.globl main
main:
li a7,4
la a0,firstRange
ecall
li a7,4
la a0,newline
ecall

	li a7,5         #input data (first range)
	ecall
	
	mv s0,a0       #s0 equals first range
	
li a7,4
la a0,secRange
ecall
li a7,4
la a0,newline
ecall

	li a7,5    #input data (second  range)
	ecall
	mv s1,a0      #s1 equals sec range
	li a0 0
	
	mv s2, s0
	        li a0,0  
	        
	        mv t1 s2  

	 li a7,4
la a0,output
ecall     
li a0,0
	         
			   andi t2,t1,1  # t1 & 00000000...01
			   li t3, 1
			   beq t2,t3, useds
			   beqz t2,usedAddedByOne
		
		useds:
		addi s2,s2,0  
		beqz zero,loop
		usedAddedByOne:
		 addi s2,s2,1  
		  
		
		
			
		
loop:
loop1:

	bge s2, s1, exit 
		
	add a0, a0,s2
	addi s2,s2,2
	
	j loop
	
	
exit:
 mv t4 s1
	          
	          
	         
			   andi t5,t4,1  # t1 & 00000000...01
			   li t6, 1
			   beq t5,t6, isodd
			   beqz t5,notodd
		
		isodd:
		add a0, a0,s1
		notodd:
		  
		 
	
	li a7,1
	ecall

li a7,10
	ecall
