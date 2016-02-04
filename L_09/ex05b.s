        .text
        .globl ex05b
ex05b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        li $a0, 1
        jal fact              # fact(1)
        
        or $a0, $0, $v0
        li $v0, 1
        syscall               # print_int10(fact(1))
        
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        
        li $a0, 10
        jal fact              # fact(10)
        
        or $a0, $0, $v0
        li $v0, 1
        syscall               # print_int10(fact(10))
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
