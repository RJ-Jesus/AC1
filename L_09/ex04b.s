        .text
        .globl ex04b
ex04b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        li $a0, 2016
        li $a1, 2
        jal print_int_ac1   # print_int_ac1(2016, 2)
        
        li $a0, '\n'
        li $v0, 11
        syscall             # print_char('\n')
        
        li $a0, 2016
        li $a1, 10
        jal print_int_ac1   # print_int_ac1(2016, 10)
        
        li $a0, '\n'
        li $v0, 11
        syscall             # print_char('\n')
        
        li $a0, 2016
        li $a1, 16
        jal print_int_ac1   # print_int_ac1(2016, 16)
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
