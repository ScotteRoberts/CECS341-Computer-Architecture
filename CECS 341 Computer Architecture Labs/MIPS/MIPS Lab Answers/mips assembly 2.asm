#For Exercises 1-4, Use the MARS simulator to write and execute MIPS assembly code that will perform
# the high level language pseudocode. Do this in a single program source file.
#  Use comments to clearly indicate which assembly instructions correspond to each exercise and
# separate each exercise by a line of blank space. Use temporary storage registers as appropriate for more complex operations.  
####################################################################################################################################
#Only use the following instructions: add, addi, sub, and, or, nor, slt, sll, srl, lb, lh, lw, sll, srl, beq, bne, j
#Do All of exercises 1-4 sequentially in a single source file.
#  Once each exercise has been completed with code comments, copy the contents of your mips assembly source file to
# a file named mipsasm2.txt and upload to the beachboard dropbox named MIPS Asm 2
####################################################################################################################################
.data
arrayb:	.byte	0, 0, 0, 0, 0, 0, 0
arrayh: .half	30, 7, 14, 5, 12
arrayw: .word	123, 222, 249, 327, 445, 971
arrayb2: .half	0, 0, 0, 0, 0, 0, 0


.text
#Exercise 1:  Put arrayw elements in descending order using only load and store instructions
addi $s1, $zero, 4	#calculate index offset 1
addi $s2, $zero, 8	#calculate index offset 2
addi $s3, $zero, 12	#calculate index offset 3
addi $s4, $zero, 16	#calculate index offset 4
addi $s5, $zero, 20	#calculate index offset 5
lw $t0, arrayw($zero)	#123 loaded
lw $t1, arrayw($s1)	#load 222
lw $t2, arrayw($s2)	#load 249
lw $t3, arrayw($s3)	#load 327
lw $t4, arrayw($s4)	#load 445
lw $t5, arrayw($s5)	#load 971
sw $t5, arrayw($zero)	#arrayw[0] = 971
sw $t4, arrayw($s1)	#arrayw[1] = 445
sw $t3, arrayw($s2)	#arrayw[2] = 327
sw $t2, arrayw($s3)	#arrayw[3] = 249
sw $t1, arrayw($s4)	#arrayw[4] = 222
sw $t0, arrayw($s5)	#arrayw[5] = 123

#Exercise 2:  After Exercise 1 is complete, write a loop to traverse arrayw and calculate
# the difference between each consecutive pair of arrayw elements and store each difference in arrayb:
#HINT:  for(i = 0; i < 6; i++) arrayb[i] = arrayw[i+1] - arrayw[i];
addi $t1, $zero, 0	#$t1 will serve as variable i
addi $t6, $zero, 6	#$t6 will hold the value 6 for comparison
forloop:
slt $t0, $t1, $t6	#i<6?
beq $t0, $zero, endforloop
	sll $t0, $t1, 2		#multiply i by 4 to word align the array index value
	lw $t2, arrayw($t0)	#load arrayw[i] value into $t2
	addi $t0, $t0, 4	#add 4 to 
	lw $t3, arrayw($t0) #load arrayw[i+1]
	sub $t0, $t3, $t2	#calculate arrayw{i+1] - arrayw[i]
	sb $t0, arrayb($t1)	#arrayb[i] = arrayw[i+1] - arrayw[i]
	addi $t1, $t1, 1
	j forloop
endforloop:


#Exercise 3:  Use a do_while loop type of instruction sequence to overwrite each element of arrayb2 such that arrayb2[i] = 2*i+3;
#	i = 0;
#	do{
#		arrayb2[i] = 2*i+3;
#		i++;
#	}while(i<7)
addi $t2, $zero, 7
addi $t0, $zero, 0		#i = 0
dowhile:	sll $t1, $t0, 1			#calculate 2*i
			addi $t1, $t1, 3		#add 3 to 2*i
			sb $t1, arrayb2($t0)	#arrayb2[i] = 2*i+3
			addi $t0, $t0, 1		#i++
			slt $t1, $t0, $t2		#i < 7 ?
			bne $t1, $zero, dowhile	#


#Exercise 4:  Use a while loop type of instruction sequence to count the consecutive number of odd values starting at
# the beginning of arrayw
#
#	i = 0
#	while(arrayw[i]%2)
#		i++;
#
#
addi $t7, $zero 1
addi $t0, $zero, 0
whileloop:
sll $t1, $t0, 2
lw $t2, arrayw($t1)
and $t2, $t2, $t7
beq $t2, $zero, endwhile
	addi $t0, $t0, 1
	j whileloop
endwhile:
j endwhile

#keep in mind each Exercise is part of the complete program and should be done sequentailly
