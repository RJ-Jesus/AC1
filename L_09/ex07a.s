        .data
str1:   .asciiz "\nIntroduza o número de discos: "
        .align 2
        .text
        .globl ex07a
ex07a:  #####
        # $a0 <- int ndiscs
        #####
        addiu $sp, $sp, -4
        sw $ra, 0($sp)
        la $a0, str1
        li $v0, 4
        syscall               # print_str(str1)
        li $v0, 5
        syscall               # read_int()
        or $a0, $0, $v0       # ndiscs = read_int()
        blez $a0, fi1
        li $a1, 1
        li $a2, 2
        li $a3, 3
        jal tohanoi           # tohanoi(ndiscs, 1, 2, 3)
fi1:    lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
