.data
	tree: .word a
	a: .word 0, c, d
	c: .word 7, 0, 0
	d: .word 8, 0, f
	f: .word 9, 0 , 0
	
	tree2: .word a1
	a1: .word 0, c1, d1
	c1: .word 7, 0, 0
	d1: .word 8, 0, f1
	f1: .word 9, 0 , 0

.text

	la $t0, tree
	la $t1, tree2
 	lw $t0, 0($t0)
 	lw $t1, 0($t1)
 	bne $t0, $t1, inizia
 	li $s0, 1
 	j fine 
	


inizia:	
	beq $t0, $zero, diversi
	beq $t1, $zero, diversi
	la $t0, tree
	la $t1, tree2
	la $t0, ($t0)
	la $t1, ($t1)

	jal base1
	
fine:
		
	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

base1:
	lw $t0, 0($t0)
	lw $t1, 0($t1)
	j base

base:
	#bne $t0, $zero, check2
	#bne $t1, $zero, start
	#jr $ra
	beq $t0, $zero, fine2
	beq $t1, $zero, fine2
	
start:
	
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	bne $t2, $t3, diversi
	
	#bne $t4, $t5, diversi
	
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $ra, 8($sp)
	
	lw $t0, 4($t0)
	lw $t1, 4($t1)
	jal base
	
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	
	lw $t0, 8($t0)
	lw $t1, 8($t1)
	jal base
	
	lw $ra, 8($sp)
	li $s0, 1
	addi $sp, $sp, 12
	jr $ra
	
diversi:

	li $s0, 0
	addi $sp, $sp, 12
	j fine

fine2:
	bne $t1, $zero, diversi
	jr $ra
	 


	  
	  
