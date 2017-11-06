#Scott Roberts
#CECS 225
#Homework 7 Question 6-19
#Implement the strcpy function

#Use $s0 for i
addi $s0, $0, 0
#use $s1 for address of src[]
addi $s1, $0, 0
#use $s2 for address of dst[]
addi $s2, $0, 0

do:	add $t1, $s1, $s0	#t1: temporary address for src[]
	add $t2, $s2, $s0	#t2: tempoarary address for dst[]
	lb $t3, 0($t1)		#t3: load value for src[t1]
	sb $t3, 0($t2)		#t3: store value for dst[t2]
	bne #some condition that tells us we are at the end of src[]
	addi $s0, $s0, 1
	j do
done:
	 
