        .data
ZERO:   .double 0
ONE:    .double 1
d1:     .double 0.5
        .text
        .globl sqrt
sqrt:   #####
        # $f12 <- double val
        # $f4 <- double aux
        # $f0 <- double xn
        # $t0 <- int i
        #####
        ldc1 $f4, ZERO
        ldc1 $f6, d1
        ldc1 $f0, ONE           # xn = 1.0
        c.le.d $f12, $f4
        bc1f do1
        mov.d $f0, $f4
        jr $ra
do1:    mov.d $f4, $f0          # aux = xn
        div.d $f8, $f12, $f0    # val / xn
        add.d $f0, $f0, $f8     # xn + val/xn
        mul.d $f0, $f0, $f6     # xn = 0.5 * (xn + val / xn)
        c.eq.d $f4, $f0
        bc1t done1
        addiu $t0, $t0, 1       # ++i
        bge $t0, 25, done1
        b do1
done1:  jr $ra
