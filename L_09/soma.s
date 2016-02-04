        .text
        .globl soma
soma:   #####
        # $a0 <- int *array
        # $a1 <- int nelem
        # $s0 <- *array
        #####
        beqz $a1, else        # if(nelem != 0)
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        
        lw $s0, 0($a0)        # *array
        addiu $a0, $a0, 4
        subi $a1, $a1, 1
        jal soma              # soma(array+1, nelem-1)
        
        add $v0, $v0, $s0
        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
else:   li $v0, 0
        jr $ra
