#For Exercises 1-5, Use the MARS simulator to write and execute MIPS assembly code that will perform the high level language pseudocode assignment statements. This can be done in a single program source file. Use comments to clearly indicate which assembly instructions correspond to each exercise and separate each exercise by a line of blank space. Variables A through H have the following register mapping:
#A: $s0	B: $s1	C: $s2	D: $s3	E: $s4	F: $s5	G: $s6	H: $s7
#Use temporary storage registers as appropriate for more complex operations.  
#Only use the following instructions: add, addi, sub, and, or, nor, slt

#Exercise 1:
#A = 200; B = 600; C = -1200;	D = -1500;	E = -2000;
#F = (A - (B+C)) - (D + E);
addi $s0, $zero, 200	#A = 200
addi $s1, $0, 600		#B = 600
addi $s2, $0, -1200		#C = -1200
addi $s3, $0, -1500		#D = -1500
addi $s4, $0, -2000		#E = -2000
add $t0, $s1, $s2		#calculate B+C
add $t1, $s3, $s4		#calculate D+E
sub $t0, $s0, $t0		#calculate A - (B+C)
sub $s5, $t0, $t1		#final value calculated and stored in F

#Exercise 2:
#D = 2000;	E = 6000; F = 0;
#F = -D - (E + 32)	#HINT: the logical AND operation can be used to do modulus
addi $s3, $0, 2000	#D = 2000
addi $s4, $0, 6000	#E = 6000
addi $t0, $s4, 32	#E + 32 calculated
sub $t1, $0, $s3	#-D calculated
sub $s5, $t1, $t0	#final value calculated and stored in F

#Exercise 3:
#H = 500; G = 250;
#F = (H > G) ? 1 : 0;
addi $s7, $0, 500	#H = 500
addi $s6, $0, 250	#G = 250
slt $s5, $s6, $s7	#final result calculated and stored in F

#Exercise 4:
#F = 0x30
#H = F * 5	#HINT: use a series of add instructions
addi $s5, $0, 0x30	#F = 0x30
add $t0, $s5, $s5	#2*$s5 calculated
add $t1, $s5, $s5	#2*$s5 calculated
add $t1, $t1, $t0	#4*$s5 calculated
add $s7, $t1, $s5	#5*$s5 calculated and stored in H

#Exercise 5:
#G = 10,000	H = 20,000
#F = ~(G+H)+1	#tilde is bitwise inversion and can be performed using the nor instruction
addi $s6, $0, 10000	#G = 10000
addi $s7, $0, 20000	#H = 20000
add $t0, $s6, $s7	#calculate G + H
nor $t0, $0, $t0	#calculate ~(G+H)
addi $s5, $t0, 1	#final value calculated and stored in $s5

#Do All of exercises 1-5 sequentially in a single source file.  Once each exercises has been completed with code comments, copy the contents of your mips assembly source file to a file named mipsasm1.txt and upload to the beachboard dropbox named MIPS Asm 1