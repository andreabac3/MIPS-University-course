.data
	lista: .word 1, 2, 4, 6, -1, 5, 4
	len:   .word 7
	
.text
	la $t1, lista
	lw $t2, len
	addi $t2, $t2, 1
	addi $s0, $zero, 1

esegui: 
	lw $t0, 0($t1)
	slt $t5,$zero, $t0
	beq $zero, $t5, avanza
	#addi $s0, $s0, 1
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	
avanza: addi $s0, $s0, 1
	addi $t1, $t1, 4
	bne $s0, $t2, esegui
	
	
fine:	li $v0, 10
	syscall
	