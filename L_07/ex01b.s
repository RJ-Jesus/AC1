        .data
str:    .asciiz "String de teste"
        .align 2
        .text
        .globl ex01b
ex01b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str
        jal strlen
        or $a0, $0, $v0 
        li $v0, 1
        syscall               # print_int10(strlen(str))
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
