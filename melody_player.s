
.data
notes:
.byte 76,76,0,76,0,72,76,0,79,0,0,0,67,0,0,0,72,0,0,67,0,0
.byte 64,0,0,69,0,71,0,70,69,0,67,76,79,81,0,77,79,0,76,0,72,74,71,0
.byte 0,72,0,0,67,0,0,64,0,0,69,0,71,0,70,69,0,67,76,79,81,0,77,79,0,76,0,72,74,71,0,0

duration:
.byte 75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75
.byte 75,75,75,75,75,75,75,75,75,75,75,100,100,100,75,75,75,75,75,75,75,75,75,75
.byte 75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,75,100,100,100,75,75,75,75,75,75,75,
.byte 75,75,75,75,75
instrument: .byte 7
volume: .byte 120
.text
.globl main
la t0, notes
la t1, duration
la t2, instrument
la t3, volume 
main:   
addi s0,zero, 80
addi s7, zero,0
la t5, duration

loop:

lb s1, (t0)
lb s2, (t1)
lb s3, (t2)
lb s4, (t3)



mv a0,s1
mv a1, s2
mv a2, s3
mv a3, s4
li a7, 33
ecall 
addi t0,t0,1
addi t1,t1,1
addi s7,s7,1
beq t0,t5,exit
j loop

#exit
exit:
li a7, 10 #end program
ecall



