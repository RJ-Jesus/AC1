        .text
        .globl strrev
strrev: #####
        # $s0 <- $a0 <- char *str
        # $s1 <- char *p1
        # $s2 <- char *p2
        #####
        addiu $sp, $sp, -16
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $ra, 12($sp)
        or $s0, $0, $a0
        
        la $s1, 0($s0)        # p1 = str
        la $s2, 0($s0)        # p2 = str
        
while1: lb $t0, 0($s2)          
        beq $t0, $0, done1    # while(*p2 != '\0')
        addiu $s2, $s2, 1     # p2++
        b while1
done1:  addiu $s2, $s2, -1    # p2--
while2: bge $s1, $s2, done2   # while(p1 < p2)
        la $a0, 0($s1)
        la $a1, 0($s2)
        jal exchange          # exchange(p1, p2)
        addiu $s1, $s1, 1     # p1++
        addiu $s2, $s2, -1    # p2--
        b while2
done2:  or $v0, $0, $s0
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $ra, 12($sp)
        addiu $sp, $sp, 16
        jr $ra

exchange: 
        #####
        # $a0 <- char *c1
        # $a1 <- char *c2
        #####
        lb $t0, 0($a0)          # aux = *c1
        lb $t1, 0($a1)
        sb $t1, 0($a0)          # *c1 = *c2
        sb $t0, 0($a1)          # *c2 = aux
        jr $ra
