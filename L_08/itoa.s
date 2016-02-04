        .text
        .globl itoa
itoa:   #####
        # $s0 <- $a0 <- unsigned int n
        # $s1 <- $a1 <- unsigned int b
        # $a2 <- char *s
        # $s2 <- char *p
        # $a0 <- char digit
        #####
        addiu $sp, $sp, -20
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $a2, 8($sp)
        sw $s2, 12($sp)
        sw $ra, 16($sp)
        or $s0, $0, $a0
        or $s1, $0, $a1
        
        or $s2, $0, $a2       # p = s
do:     div $s0, $s1
        mfhi $a0              # digit = n % b
        mflo $s0              # n = n / b
        jal toascii     
        sb $v0, 0($s2)        # *p = toascii(digit)
        addiu $s2, $s2, 1     # p++
        ble $s0, 0, done      # while(n > 0)
        b do
done:   sb $0, 0($s2)         # *p = '\0'
        lw $a0, 8($sp)
        jal strrev            # strrev(s)
        
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $v0, 8($sp)
        lw $s2, 12($sp)
        lw $ra, 16($sp)
        addiu $sp, $sp, 20
        jr $ra


toascii:
        #####
        # $v0 <- $a0 <- char v
        #####
        addi $v0, $a0, '0'    # v += '0'
        ble $v0, '9', fi
        addi $v0, $v0, 7
fi:     jr $ra
