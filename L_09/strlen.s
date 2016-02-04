        .text
        .globl strlen
strlen: #####
        # $s0 <- $a0 <- char *s
        #####
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        or $s0, $0, $a0
        lb $t0, 0($a0)          
        beqz $t0, else            # if(*s != '\0')
        addiu $a0, $a0, 1
        jal strlen                # strlen(s+1)
        addiu $v0, $v0, 1
        b fi
else:   li $v0, 0
fi:     lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
