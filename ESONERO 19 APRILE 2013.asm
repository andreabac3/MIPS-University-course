#vector v, 
#n = v.lenght
#write a program able to print all element in V[I] position if i is even

.data
    	n: .word 6
    	v: .word 2,-6,7,5,-4,0
    
.text
	lui $t0, 0x1001     # memory address
	addi $s0, $zero, 0  # reset i counter
	lw $t1, 0($t0)      # n
ripeti:	lw $t2, 4($t0)      # first element
	slt $t3, $t2, $zero        # t3 = 1 se $t2 < 0
	bne $t3, $zero, nonstampa    
	
	move $a0, $s0       # print position i 
	li $v0, 1
	syscall
	
nonstampa: addi $t0, $t0, 4    # get next element
	addi $s0, $s0, 1       # incremento contatore
	bne $s0, $t1, ripeti   # repeat until counter == n
        
        li $v0, 10
        syscall