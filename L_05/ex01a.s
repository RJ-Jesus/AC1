        .eqv SIZE 5
        .data
lista:  .word 0:SIZE
str:    .asciiz "Introduza um número: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int i
        # $t1 <- lista
        # $t2 <- &lista[i]
        #####
        la $t1, lista
        ori $t0, $0, 0        # i = 0
for:    slti $t3, $t0, SIZE
        beq $t3, $0, done     # for(*; i < SIZE; *)

        la $a0, str
        ori $v0, $0, 4
        syscall               # print_str(str)

        ori $v0, $0, 5
        syscall
        sll $t2, $t0, 2
        addu $t2, $t1, $t2
        sw $v0, 0($t2)        # list[i] = read_int()
        
        addi $t0, $t0, 1      # i++
        b for             
done:   jr $ra
