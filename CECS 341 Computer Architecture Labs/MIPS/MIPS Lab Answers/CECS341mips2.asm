.data
arrayb:	.byte	0, 0, 0, 0, 0, 0, 0
arrayh: .half	30, 7, 14, 5, 12
arrayw: .word	123, 222, 249, 327, 445, 971
arrayb2: .half	0, 0, 0, 0, 0, 0, 0


.text
#Exercise 1:  Put arrayw elements in descending order using only addi, load, and store instructions
#Grab all values from arrayw, set them to temps, then set the temps in reverse order back into the array.
la $t1, arrayw
lw $t2, 0($t1)
lw $t3, 4($t1)
lw $t4, 8($t1)
lw $t5, 12($t1)
lw $t6, 16($t1)
lw $t7, 20($t1)
sw $t7, 0($t1)
sw $t6, 4($t1)
sw $t5, 8($t1)
sw $t4, 12($t1)
sw $t3, 16($t1)
sw $t2, 20($t1)


#Exercise 2:  After Exercise 1 is complete, write a loop to traverse arrayw and calculate
# the difference between each consecutive pair of arrayw elements and store each difference in arrayb
#HINT:  for(i = 0; i < 6; i++) arrayb[i] = arrayw[i+1] - arrayw[i];
addi $t6, $0, 7			#initialize loop counter
la $t1, arrayw			#grab address from arrayw
la $t2, arrayb			#grab address from arrayb
for1:
	beq $t6, $0, endFor1	#branch if loop variable is 0
	lw $t3, 0($t1)		#load word from arrayw
	lw $t4, 4($t1)		#load next word from arrayw
	sub $t5, $t4, $t3	#subtract both loaded values
	sb $t5, 0($t2)		#set byte to arrayb from subtracted values (HELP)
	addi $t1, $t1, 4	#Increment index for arrayw
	addi $t2, $t2, 1	#Increment index for arrayb
	subi $t6, $t6, 1	#Decrement loop variable
	j for1
endFor1:


#Exercise 3:  Use a do_while loop type of instruction sequence to overwrite each element of arrayb2 such that arrayb2[j] = 2*j+3;
addi $t6, $0, 7			#initialize loop variable
la $t2, arrayb2			#get address of arrayb2
do1:
	beq $t6, $0, while1	#branch if loop variable equals 1
	lh $t3, 0($t2)		#load half from index($t2) of arrayb2
	sll $t3, $t3, 1		#multiply by 2
	add $t3, $t3, 3		#add 3
	sh $t3, 0($t2)		#set half to index($t2) of arrayb2
	addi $t2, $t2, 2	#increase index of arrayb2
	subi $t6, $t6, 1	#decrement counter
	j do1
while1:


#Exercise 4:  Use a while loop type of instruction sequence to count
# the consecutive number of odd values starting at the beginning of arrayw
addi $t1, $0, 0			#initialize count variable
la $t2, arrayw			#grab address of arrayw
addi $t5, $0, 1			#using a 1
while2:
	lw $t3, 0($t2)		#load from arrayw
	and $t4, $t3, $t5	#array value AND with 1
	beq $t4, $0, done	#if value is 0 (even) branch away to done
	addi $t1, $t1, 1	#Increment Count
	addi $t2, $t2, 4	#Move arrayw index to next word
	j while2
done:






