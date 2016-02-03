        .data
array:  .word 7692 23 5 234
        .text
        .globl main
main:   #####
        # $t0 <- int i
        # $t1 <- array
        # $t2 <- array[i]
        # $t3 <- int soma
        #####
        la $t1, array
        li $t3, 0             # soma = 0
        li $t0, 0             # i = 0
for:    bge $t0, 4, done      # for(*; i < 4; *)
        sll $t2, $t0, 2
        addu $t2, $t1, $t2
        lw $t2, 0($t2)
        add $t3, $t2, $t3     # soma += *p
        addi $t0, $t0, 1      # i++
        b for
done:   or $a0, $0, $t3
        li $v0, 1
        syscall               # print_int10(soma)
        jr $ra
