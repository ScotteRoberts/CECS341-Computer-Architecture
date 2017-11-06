
##########################################################################
#############MIPS Programming assignment 3 Instructions###################
#Complete the program to find max, min, and average of an array of values#
# *be sure to use the Default setting in the MIPS Memory Configuration*  #
#Complete the missing lines of code using the comments as hints          #
#Once your program is verified to work correctly, copy the contents of   #
#your assembly source into a file named mips3.txt and submit to beachboard
##########################################################################

.data	#data address is 0x10010000
array1: .word 102, 57, 201, 530, 270, 341, 440, 225, 99, 199, 299, 399, 359, 258, 157, 176
msg1:	.asciiz "The maximum array value is: "
msg2:	.asciiz "\nThe minumum array value is: "
msg3:	.asciiz "\nThe average array value is: "

.text
main:
#############################################
# find max value of array1 and put into $s7 #
#############################################
lui $a0, 0x1001			#put high byte of array1 address in high byte of $a0
ori $a0, $a0, 0			#put low byte of array1 address in $a0 pass by reference
addi $a1, $zero, 16		#$a1 is array length, pass by value
jal arrayMax			#call arrayMax function
add $s7, $zero, $v0		#put the value returned into $s7

#############################################
# find min value of array1 and put into $s6 #
# pass arguments to function and call arrayMin#
#############################################
lui $a0, 0x1001			#put high byte of array1 address in high byte of $a0
ori $a0, $a0, 0			#put low byte of array1 address in $a0 pass by reference
addi $a1, $zero, 16		#$a1 is array length, pass by value
jal arrayMin			#call arrayMin function
add $s6, $zero, $v0		#put the value returned into $s6


###############################################
# find average of array1 and put into $s5     #
# pass arguments to function and call arrayAvg#
###############################################
lui $a0, 0x1001			#put high byte of array1 address in high byte of $a0
ori $a0, $a0, 0			#put low byte of array1 address in $a0 pass by reference
addi $a1, $zero, 16		#$a1 is array length, pass by value
jal arrayAvg			#call arrayAvg function
add $s5, $zero, $v0 		#put the value returned into $s5


####################################################################################
#display maximum value message and maximum array value
li $v0, 4			#load serice code 4 ( print string)
la $a0, msg1			#message to be displayed
syscall				#print the string!
li $v0, 1			#load service code 1 (print integer)
addi $a0, $s7, 0 		#load value to be printed int a0
syscall				#print the integer

#display minimum value message and minimum array value
li $v0, 4			#load serice code 4 ( print string)
la $a0, msg2			#message to be displayed
syscall				#print the string!
li $v0, 1			#load service code 1 (print integer)
addi $a0, $s6, 0		#load value to be printed int a0
syscall				#print the integer

#display average value message and average array value
li $v0, 4			#load serice code 4 ( print string)
la $a0, msg3			#message to be displayed
syscall				#print the string!
li $v0, 1			#load service code 1 (print integer)
addi $a0, $s5, 0		#load value to be printed int a0
syscall				#print the integer

#exit to operating system
li $v0, 10			#load service code 10 (terminate execution)
syscall				#we are outta here!
####################################################################################
#####################################################################################
#							END OF MAIN PROGRAM SECTION								#
#####################################################################################


########################################### 
# arrayMax:
# function expected arguments
#	$a0 = array
#	$a1 = arraylength
#
# function return values
#	$v0 = max array value
#
# function pseudocode:
#	int arrayMax(int array[], int arraylength){
#	arraymax = 0;
#	for(i = 0; i < arraylength; i++)
#		if(array[i] >= arraymax)
#			arraymax = array[i];
#	return arraymax;  }
#
########################################### 

arrayMax:
		add $t0, $zero, $a0			#put array base address (arg0) in temp register
		add $t7, $zero, $zero		#initialize $t7 to 0, $t7 will hold max array value
		add $t3, $zero, $zero		#$t3 will be "iterating variable", initialized to zero
L1:		slt $t1, $t3, $a1			#check if $t3 < arg1 i.e. array_length
		beq $t1, $zero, L1end		#if iterating variable >= array length then end loop
			lw $t1, 0($t0)			#load an array element
			slt $t2, $t1, $t7		#compare array element to max array value
			bne $t2, $zero, less	#branch if array element is less than max
				add $t7, $zero ,$t1	#if array element not less than max, store it in $t7
less:		addi $t0, $t0, 4		#increment $t0 to next array element address
			addi $t3, $t3, 1		#increment iterating variable
			j L1					#go back to check loop continuing condition
L1end:	add $v0, $zero, $t7			#put max array value into return value register
		jr $ra						#return from function!
#################################################################################

########################################### 
# arrayMin:
# function expected arguments
#	arg0 = $a0 = array
#	arg1 = $a1 = arraylength
#
# function return values
#	$v0 = min array value
#
# function pseudocode:
#	int arrayMin(int array[], int arraylength){
#		arraymin = 0;
#		for(i = 0; i < arraylength; i++)
#			if(array[i] <= arraymin)
#				arraymin = array[i];
#		return arraymin;  }
#
########################################### 
arrayMin:
		add $t0, $zero, $a0			#put array address in temp register
		addi $t7, $zero, 32767				#initialize $t7 to 32767, $t7 will hold min array value
		add $t3, $zero, $zero					#$t3 will be "iterating variable", initialized to zero
L2:		slt $t1, $t3, $a1					#check if $t3 < array length
		beq $t1, $zero, L2end					#if iterating variable >= array length then end loop
			lw $t1, 0($t0)				#load an array element
			slt $t2, $t1, $t7				#compare array element to min array value
			beq $t2, $zero, greater				#branch if array element is greater than min
				add $t7, $t1, $zero			#if array element not less than max, store it in $t7
greater:	addi $t0, $t0, 4					#increment $t0 to next array element address
		addi $t3, $t3, 1					#increment iterating variable
		j L2					#go back to check loop continuing condition
L2end:	add $v0, $zero, $t7							#put min array value into return value register
	jr $ra						#return from function!
#################################################################################

########################################### 
# arrayAvg:
# function expected arguments
#	arg0 = $a0 = array
#	arg1 = $a1 = arraylength
#
# function return values
#	$v0 = average array value
#
# function pseudocode:
#	int arrayAvg(int array[], int arraylength){
#	arrayavg = 0;
#	arraysum = 0;
#	for(i = 0; i < arraylength; i++)
#		arraysum += array[i];
#	arrayavg = divPwr2(arraylength, arraysum);
#	retutn arrayavg;   }
#
#
########################################### 
arrayAvg:
		add $t0, $zero, $a0			#put array address in temp register
		add $t7, $zero, $zero					#initialize $t7 to 0, $t7 will hold sum of array values (arraysum)
		add $t3, $zero, $zero					#$t3 will be "iterating variable", initialized to zero
L3:		slt $t1, $t3, $a1 					#check if $t3 < array length
			beq $t1, $zero, L3end					#if iterating variable >= array length then end loop
			lw $t1, 0($t0)				#load an array element
			add $t7, $t7, $t1				#add array element to $t7
			addi $t0, $t0, 4				#increment $t0 to next array element address
			addi $t3, $t3, 1				#increment iterating variable
			j L3				#go back to check loop continuing condition
L3end:		add $a2, $zero, $t7					#assign arraysum to a2 register
		add $a3, $zero, $t3  #look here							#assign arraylength to a3 register
		add $s0, $ra, $zero			#save main function return address into $s0
		jal divPwr2					#call dividie by power of 2 function
		add $v0, $zero, $v1			#put average into return value register
		add $ra, $s0, $zero			#restore main function return address 
		jr $ra						#return from function!
	


########################################### 
# divPwr2:	performs division by shifting right by log base 2 conversion of a value
#			log base 2 of the value is determined using lookup table
# function expected arguments
#	$a2 = dividend
#	$a3 = divisor
#
# function return values
#	$v1 = quotient
#
# function pseudocode:
#	int divPwr2(int dividend, int divisor);
#	switch(divisor){
#		case 1: return dividend>>0;
#		case 2: return dividend>>1;
#		case 4: return dividend>>2;
#		case 8: return dividend>>3;
#		case 16: return dividend>>4;
#		case 32: return dividend>>5;
#		default: return -1;
#	}
#
#
########################################### 
divPwr2:
		addi $t1, $zero, 1
		addi $t2, $zero, 2
		addi $t3, $zero, 4
		addi $t4, $zero, 8
		addi $t5, $zero, 16
		addi $t6, $zero, -1
		bne $a3, $t1, not1
			srl $v1, $a2, 0
			jr $ra
not1:	bne $a3, $t2, not2
			srl $v1, $a2, 1
			jr $ra
not2:	bne $a3, $t3, not4
			srl $v1, $a2, 2
			jr $ra
not4:	bne $a3, $t4, not8
			srl $v1, $a2, 3
			jr $ra
not8:	bne $a3, $t5, default
			srl $v1, $a2, 4
			jr $ra
default:	addi $v1, $zero, -1
			jr $ra

		

