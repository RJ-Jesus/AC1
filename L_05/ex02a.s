        .eqv SIZE 10
        .data
lista:  .word 8 -4 3 5 124 -15 87 9 27 15
str:    .asciiz "\nConteúdo do array:\n"
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int *p
        # $t1 <- int i
        #####
        la $t0, lista         # p = lista
        la $a0, str
        ori $v0, $0, 4
        syscall               # print_str(str)

        ori $t1, $0, 0        # i = 0
for:    slti $t3, $t1, SIZE 
        beq $t3, $0, done     # for(*; i < SIZE; *)

        lw $a0, 0($t0)
        ori $v0, $0, 1
        syscall               # print_int10(*p)

        ori $a0, $0, '-'
        ori $v0, $0, 11
        syscall               # print_char('-')

        addi $t0, $t0, 4      # p++
        addi $t1, $t1, 1      # i++
        b for             
done:   jr $ra
