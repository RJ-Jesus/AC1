        .data
array:  .word 7692 23 5 234
        .text
        .globl main
main:   #####
        # $t0 <- int *p
        # $t1 <- int *pultimo
        # $t2 <- *p
        # $t3 <- int soma
        #####
        li $t3, 0             # soma = 0
        la $t0, array         # p = array
        addiu $t1, $t0 12     # pultimo = array + 3
while:  bgt $t0, $t1, done    # while(p <= pultimo)
        lw $t2, 0($t0)
        add $t3, $t2, $t3     # soma += *p
        addiu $t0, $t0, 4     # p++
        b while
done:   or $a0, $0, $t3
        li $v0, 1
        syscall               # print_int10(soma)
        jr $ra
