        .data
str:    .space 20
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int num
        # $t1 <- char *p
        # $t2 <- *p
        #####
        li $t0, 0             # num = 0
        la $a0, str
        li $a1, 20
        li $v0, 8
        syscall               # read_str(str, 20)
        la $t1, str           # p = str
while:  lb $t2, 0($t1)
        beq $t2, '\0', done   # while(*p != '\0')
        blt $t2, '0', fi      # if(*p >= '0' && \
        bgt $t2, '9', fi      # *p <= '9')
        addi $t0, $t0, 1      # num++
fi:     addiu $t1, $t1, 1     # p++
        b while
done:   or $a0, $0, $t0
        li $v0, 1
        syscall               # print_int10(num)
        jr $ra
