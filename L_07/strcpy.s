        .text
        .globl strcpy
strcpy: #####
        # $a0 <- char *dst
        # $a1 <- char *src
        # $t0 <- int i
        #####
        li $t0, 0             # i = 0
do:     addu $t1, $a1, $t0
        lb $t1, 0($t1)
        addu $t2, $a0, $t0    
        sb $t1, 0($t2)        # dst[i] = src[i]
        addiu $t0, $t0, 1     # i++
        beq $t1, $0, done     # while(src[i] != '\0')
        b do
done:   or $v0, $0, $a0
        jr $ra
