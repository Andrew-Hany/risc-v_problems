.data
newline:.asciz "\n"
unkn:.asciz "unknown instrunction"
R_formate: .asciz "R-formate"
I_formate:.asciz "I-formate"
add:.asciz "add  "
sub:.asciz "sub  "
sll:.asciz "sll  "
slt:.asciz "slt  "
sltu:.asciz "sltu  "
xor:.asciz "xor  "
srl:.asciz "srl  "
sra:.asciz "sra  "
or:.asciz "or  "
and:.asciz "and  "
lb:.asciz "lb  "
lh:.asciz "lh  "
lw:.asciz "lw  "
lbu:.asciz "lbu  "
lhu:.asciz "lhu  "
addi:.asciz "addi  "
slti:.asciz "slti  "
sltiu:.asciz "sltiu  "
xori:.asciz "xori  "
ori:.asciz "ori  "
andi:.asciz "andi  "
slli:.asciz "slli  "
srli:.asciz "srli  "
srai:.asciz "srai  "
.text
.globl main
main:

#for dissambler to read-------------and i used some registers for the dissambler 
li s0,0x00400000

add t3, s6,s5
sub t4, s6,s5 
and t5, s5, t2
sll  t3,s6, s5
lui t5,21
auipc t5,21
andi t5, s5, 2
slli  t3,s6, 5
srai  t1,s6, 8
add t3, s6,s5
sub t4, s6,s5 
and t5, s5, t2
sll  t3,s6, s5
sra  t1,s6, s8
xor   t2, s3, s5
lh t3, 0(s0)
addi t3, s6,5

andi t5, s5, 2
slli  t3,s6, 5
srai  t1,s6, 8
srli  t1,s6, 8
xori   t2, s3, 5
lb t3, 0(s0)
#-------------------------------------------------

li s1, 0x33
li s2, 0x3
li s3, 0x13 
li s4, 32
li s5, 1
li s6, 2
li s8, 3
li s9, 4
li s10, 5
li s11, 6
li t6, 7


li s8,0  #counter
li s7, 25, #end of loop
loop:
beq s8,s7, exit 
lw a0,0(s0)
mv t0 , a0
andi a0, a0 ,0x7F


beq a0,s1 ,R
beq a0,s2 ,I1
beq a0,s3 ,I2

la a0,unkn
li a7, 4
ecall
beq zero,zero,jum
#----------------------I load
I1:
srli t0,t0, 12
andi t0,t0, 7

beq t0,s5,Lh
beq t0,s6,Lw
beq t0,s8,Lbu
beq t0,s9,Lhu

Lb:
la a0,lb
li a7, 4
ecall
beq zero,zero, conI
#lh
Lh:
la a0,lh
li a7, 4
ecall
beq zero,zero, conI
#lw
Lw:
la a0,lw
li a7, 4
ecall
beq zero,zero, conI
#lbu
Lbu:
la a0,lbu
li a7, 4
ecall
beq zero,zero, conI
Lhu:
la a0,lhu
li a7, 4
ecall
beq zero,zero, conI
conI:
la a0,I_formate
li a7, 4
ecall
beq zero,zero,jum
#--------------------------------
#I- A/L----------------
I2:
srli t0,t0, 12
andi t1,t0, 7

beq t1,s5,Slli
beq t1,s6,Slti
beq t1,s8,Sltiu
beq t1,s9,Xori
beq t1,s10,Srli_Srai
beq t1,s11,Ori
beq t1,t6,Andi
Addi:
la a0,addi
li a7, 4
ecall
beq zero,zero, con2
#Slti
Slti:
la a0,slti
li a7, 4
ecall
beq zero,zero, con2
#Sltiu
Sltiu:
la a0,sltiu
li a7, 4
ecall
beq zero,zero, con2
#Xori
Xori:
la a0,xori
li a7, 4
ecall
beq zero,zero, con2
Ori:
la a0,ori
li a7, 4
ecall
beq zero,zero, con2
Andi:
la a0,andi
li a7, 4
ecall
beq zero,zero, con2
#Slli
Slli:
la a0,slli
li a7, 4
ecall
beq zero,zero, con2
Srli_Srai:
srai t0,t0,13
beq t0,zero,Srli
Srai:
la a0,srai
li a7, 4
ecall
beq zero,zero, con2
Srli:
la a0,srli
li a7, 4
ecall
beq zero,zero, con2
con2:
la a0,I_formate
li a7, 4
ecall
beq zero,zero,jum
#-------------------------------------
#R-instructions
#-------------------------------------------------
R:
srai t0,t0, 12
andi t1,t0, 7
beq t1,s5,Sll
beq t1,s6,Slt
beq t1,s7,Sltu
beq t1,s8,Xor
beq t1,s9,Srl
beq t1,s10,Sra
beq t1,s10,Or
beq t1,t6,And
beqz t1,Add_sub 

#add&sub

Add_sub:
srai t0,t0, 13

beq t0,s4, Sub

la a0,add
li a7, 4
ecall
beq zero,zero,con
Sub:
la a0,sub
li a7, 4
ecall
beq zero,zero,con
#sll
Sll:
la a0,sll
li a7, 4
ecall
beq zero,zero,con
#slt
Slt:
la a0,slt
li a7, 4
ecall
beq zero,zero,con
#sltu
Sltu:
la a0,sltu
li a7, 4
ecall
beq zero,zero,con
#xor
Xor:
la a0,xor
li a7, 4
ecall
beq zero,zero,con
#Srl
Srl:
la a0,srl
li a7, 4
ecall
beq zero,zero,con
#Sra
Sra:
la a0,sra
li a7, 4
ecall
beq zero,zero,con
#or
Or:
la a0,or
li a7, 4
ecall
beq zero,zero,con
#oandr
And:
la a0,and
li a7, 4
ecall
beq zero,zero,con
con:
la a0,R_formate
li a7, 4
ecall
#___________________________________________
jum:
#---------

la a0,newline
li a7, 4
ecall
addi s0,s0,4
addi s8,s8,1
j loop
exit:
li a7, 10
ecall


