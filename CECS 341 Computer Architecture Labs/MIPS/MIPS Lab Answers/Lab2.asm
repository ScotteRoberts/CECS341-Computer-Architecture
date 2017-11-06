#A: $s0	B: $s1	C: $s2	D: $s3	E: $s4	F: $s5	G: $s6	H: $s7

.text
#Exercise 1:
#A = 200; B = 600; C = -1200;	D = -1500;	E = -2000;
#F = (A - (B+C)) - (D + E);
#Initialize Variables
	addi $s0, $0, 200
	addi $s1, $0, 600
	addi $s2, $0, -1200
	addi $s3, $0, -1500
	addi $s4, $0, -2000
#Setup Temp Variables
	add $t0, $s1, $s2
	add $t1, $s3, $s4
	sub $t2, $s0, $t1
#Question
	sub $s5, $t2, $t1


#Exercise 2:
#D = 2000;	E = 6000; F = 0;
#F = -D - (E + 32)	#HINT: the logical AND operation can be used to do modulus
#Initialize Variables
	addi $s3, $0, 2000
	addi $s4, $0, 6000
	addi $s5, $0, 0
#Setup Temp Variables
	addi $t0, $s4, 32
	sub $t1, $0, $3
#Question
	sub $s5, $t1, $t0


#Exercise 3:
#H = 500; G = 250;
#F = (H > G) ? 1 : 0;
#Initialize Variables
	addi $s7, $0, 500
	addi $s6, $0, 250
#Question
	slt $s5, $s7, $s6


#Exercise 4:
#F = 0x30
#H = F * 5	#HINT: use a series of add instructions
#Initialize Variables
	addi $s5, $0, 0x30 	
#Question
	add $s7, $s5, $s5
	add $s7, $s7, $s5
	add $s7, $s7, $s5
	add $s7, $s7, $s5


#Exercise 5:
#G = 10,000	H = 20,000
#F = ~(G+H)+1	#tilde is bitwise inversion and can be performed using the nor instruction
#Initialize Variables
	addi $s6, $0, 10000
	addi $s7, $0, 20000
#Setup Temp Var.
	add $t0, $s6, $s7
	nor $t0, $t0, $0
	addi $t0, $t0, 1
