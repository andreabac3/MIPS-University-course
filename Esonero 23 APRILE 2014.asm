.data 
	lista: .word  1, 2, -4, 6, -1, 5, 4
	lun:   .word 7
	
.text
	la $t1, lista
	lw $t2, lun
	addi $s0, $zero, 0 #Total Sum
esegui: 
	lw $t0, 0($t1)
	slt $t5, $zero, $t0
	beq $t5, $zero avanza
	add $s0, $s0, $t0
	
avanza: 
	addi $t1, $t1, 4
	addi $t2, $t2, -1
	bne $zero, $t2, esegui
	
	li $v0, 1
	addi $a0, $s0, 0
	syscall
	
	
	
