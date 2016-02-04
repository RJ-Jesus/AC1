        .data
str:    .asciiz "2040, o ano do fim das PPP"
        .align 2
        .text
        .globl ex01b
ex01b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str
        jal atoi  
        or $a0, $0, $v0     # print_int10(atoi(str))
        li $v0, 1
        syscall
        
        or $v0, $0, $0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
