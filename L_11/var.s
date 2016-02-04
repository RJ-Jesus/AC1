        .data
ZERO: .double 0.0
        .text
        .globl var
var:    #####
        # #s0 <- $a0 <- double *array
        # #s1 <- $a1 <- int nval
        # $s2 <- int i
        # $f20 <- double media
        # $f22 <- double soma
        # $f24 <- double res
        #####
        addiu $sp, $sp, -40
        swc1 $f20, 0($sp)
        swc1 $f21, 4($sp)
        swc1 $f22, 8($sp)
        swc1 $f23, 12($sp)
        swc1 $f24, 16($sp)
        swc1 $f25, 20($sp)
        sw $s0, 24($sp)
        sw $s1, 28($sp)
        sw $s2, 32($sp)
        sw $ra, 36($sp)
        or $s0, $0, $a0
        or $s1, $0, $a1
        jal average               # average(array, nval)
        mov.d $f20, $f0           # media = average(array, nval)
        li $s2, 0                 # i = 0
        ldc1 $f22, ZERO           # soma = 0.0
for1:   bge $s2, $s1, done1       # for(*; i < nval; *)
        sll $t0, $s2, 3           # i << 3
        addu $t0, $t0, $s0        # &array[i]
        ldc1 $f12, 0($t0)         # array[i]
        sub.d $f12, $f12, $f20    # array[i] - media
        li $a0, 2
        jal xtoy                  # xtoy(array[i]-media, 2)
        add.d $f22, $f22, $f0     # soma += xtoy(array[i]-media, 2)
        addiu $s2, $s2, 1         # i++
        b for1
done1:  mtc1 $s1, $f4
        cvt.d.w $f4, $f4
        div.d $f24, $f22, $f4     # res = soma / nval
        mov.d $f0, $f24
        lwc1 $f20, 0($sp)
        lwc1 $f21, 4($sp)
        lwc1 $f22, 8($sp)
        lwc1 $f23, 12($sp)
        lwc1 $f24, 16($sp)
        lwc1 $f25, 20($sp)
        lw $s0, 24($sp)
        lw $s1, 28($sp)
        lw $s2, 32($sp)
        lw $ra, 36($sp)
        addiu $sp, $sp, 40
        jr $ra
