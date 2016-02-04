        .data
str:    .asciiz "0000011111111000, o ano do fim das PPP"
        .align 2
        .text
        .globl ex01c
ex01c:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str
        jal atoi2   
        or $a0, $0, $v0     # print_int10(atoi2(str))
        li $v0, 1
        syscall
        
        or $v0, $0, $0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
