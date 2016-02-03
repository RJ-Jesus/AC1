        .data
str:    .space 20
str1:   .asciiz "Introduza uma string: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- char *p
        # $t1 <- *p
        #####
        la $a0, str1
        li $v0, 4
        syscall               # print_str(str1)
        la $a0, str
        li $a1, 20
        li $v0, 8
        syscall               # read_str(str, 20)
        la $t0, str           # p = str
while:  lb $t1, 0($t0)
        beq $t1, '\0', done   # while(*p != '\0')
        subi $t1, $t1, 'a'
        addi $t1, $t1, 'A'
        sb $t1, 0($t0)        # *p = *p - 'a' + 'A'
        addiu $t0, $t0, 1     # p++
        b while
done:   la $a0, str
        li $v0, 4
        syscall               # print_str(str)
        jr $ra
