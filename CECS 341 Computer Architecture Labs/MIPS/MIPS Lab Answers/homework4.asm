#Exercise 1: C = A + B
addi $16, $0, 50
addi $17, $0, 120
add $18, $16, $17

#Exercise 2: D = A - B
addi $16, $0, -30
addi $17, $0, -52
sub $19, $16, $17

#Exercise 3: F = (A + B - C) - (D - E)
#$1 = A + B - C
#$2 = D - E
#F = $1 - $2
addi $16, $0, 20
addi $17, $0, 60
addi $18, $0, 120
addi $19, $0, -150
addi $20, $0, -200
add $1, $16, $17
sub $1, $1, $18
sub $2, $19, $20
sub $21, $1, $2

#Exercise 4: F = F - A + B
addi $16, $0, 20
addi $17, $0, 30
sub $21, $21, $16
add $21, $21, $17

#Exercise 5: G = B - A
addi $16, $0, 0x89ab
addi $17, $0, 0x98b3
sub $22, $17, $16

#Exercise 6: H = B + B + B + B + B
addi $17, $0, 0x1d
add $23, $17, $17
add $23, $23, $17
add $23, $23, $17
add $23, $23, $17
add $23, $23, $17

#Exercise 7: A = A - 0x1c
addi $16, $0, 25
subi $16, $16, 0x1c

#Exercise 8: D = (G - E) + 200 - (F - B - 90)
#$8 = G - E
#$9 = F - B - 90
#D = $8 + 200 - $9
addi $22, $0, 240
addi $20, $0, 100
addi $21, $0, 70
addi $17, $0, 40
sub $8, $22, $20
sub $9, $21, $17
subi $9, $9, 90
addi $19, $8, 200
sub $19, $19, $9

#Exercise 9: A = F + (D - G)
addi $21, $0, 70
addi $19, $0, 456
addi $22, $0, 0x44
add $16, $21, $19
sub $16, $16, $22

#Exercise 10: B = B - 0x1357
addi $17, $0, 0x2468
subi $17, $17, 0x1357