        .text
        .globl strcpy
strcpy: #####
        # $s0 <- $a0 <- char *dst
        # $a1 <- char *src
        #####
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        or $s0, $0, $a0
        
        lb $t0, 0($a1)      # *src
        sb $t0, 0($a0)      # *dst = *src
        beqz $t0, fi        # if(*src != '\0')
        addiu $a0, $a0, 1
        addiu $a1, $a1, 1
        jal strcpy          # strcpy(dst+1, src+1)
fi:     or $v0, $0, $s0
        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
