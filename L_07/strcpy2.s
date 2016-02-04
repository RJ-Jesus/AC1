        .text
        .globl strcpy2
strcpy2:
        #####
        # $a0 <- char *dst
        # $a1 <- char *src
        # $v0 <- char *p
        #####
        or $v0, $0, $a0     # p = dst
do:     lb $t0, 0($a1)      # *src
        sb $t0, 0($a0)      # *dst = *src
        addiu $a0, $a0, 1   # dst++
        beq $t0, $0, done   # while(*src != '\0')
        addiu $a1, $a1, 1   # src++  // Not really translated. But it's better this way
        b do
done:   jr $ra
