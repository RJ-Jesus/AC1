        .text
        .globl stdev
stdev:  #####
        # $a0 <- double *array
        # $a1 <- int nval
        #####
        addiu $sp, $sp, -4
        sw $ra, 0($sp)
        jal var               # var(array, nval)
        mov.d $f12, $f0
        jal sqrt              # sqrt(var(array, nval))
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
