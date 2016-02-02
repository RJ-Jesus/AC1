        .eqv x 1
        .text 
        .globl main 
main:   ori $t0, $0, x        # $t0 = x
        ori $t2, $0, 8        # $t2 = 8
        add $t1, $t0, $t0     # $t1 = x + x = 2 * x
        sub $t1, $t1, $t2     # $t1 = y = 2 * x - 8
        jr $ra
