.data
	
	lista: .word 3, 2, -4 , 6, -1 , 5, 4
	lun:   .word 7
	
.text
	#la $t0, 0x1001000
	la $t0, lista
	lw $t1, 0($t0)
	lw $s0, lista
	lw $t2, lun

esegui:	
	slt $t5, $zero, $t1 	#if even
	beq $t5, $zero, avanza	
	slt $t5, $t1, $s0	#compare with temp variable
	beq $t5, $zero, avanza
	add $s0, $zero, $t1
	
	
avanza:	
	addi $t0, $t0, 4
	addi $t2, $t2, -1
	lw $t1, 0($t0)
	bne $zero, $t2, esegui 
	
	
 	li $v0, 1
 	addi $a0, $s0, 0	
	syscall
	