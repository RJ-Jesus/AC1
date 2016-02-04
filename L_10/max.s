        .text
        .globl max
max:    #####
        # $a0 <- double *arr
        # $a1 <- unsigned int n
        # $t0 <- double *last
        # $f0 <- double max
        #####
        sll $t0, $a1, 3       # n << 3
        addu $t0, $a0, $t0    # arr + (n << 3)
        lui $t1, 0xFFEF
        ori $t1, $t1, 0xFFFF
        mtc1 $t1, $f1
        lui $t1, 0xFFFF
        mtc1 $t1, $f0         # sum = DBL_MIN
        #lui $t1, 0xFFF0
        #mtc1 $t1, $f1
        #lui $t1, 0x0000
        #mtc1 $t1, $f0          # sum = -infty
while1: bge $a0, $t0, done1   # while(max < *arr)
        ldc1 $f4, 0($a0)      # *arr
        c.lt.d $f0, $f4
        bc1f fi1
        mov.d $f0, $f4
fi1:    addiu $a0, $a0, 8     # arr++
        b while1
done1:  jr $ra
