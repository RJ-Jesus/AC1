        .text
        .globl atoi
atoi:   #####
        # $a0 <- char *s
        # $t0 <- int digit
        # $v0 <- int res
        #####
        or $v0, $0, $0        # res = 0
while:  lb $t2, 0($a0)      
        blt $t2, '0', done    # while(*s >= '0' && \
        bgt $t2, '9', done    # *s <= '9')
        subi $t0, $t2, '0'    # digit = *s - '0'
        addiu $a0, $a0, 1     # s++
        mul $v0, $v0, 10      # 10 * res
        add $v0, $t0, $v0     # res = 10 * res + digit
        b while
done:   jr $ra
