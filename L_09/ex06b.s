        .text
        .globl ex06b
ex06b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        li $a0, 10
        li $a1, 2
        jal xtoy            # xtoy(10, 2)
        
        or $a0, $0, $v0
        li $v0, 1
        syscall             # print_int10(xtoy(10, 2))
        
        li $a0, '\n'
        li $v0, 11
        syscall             # print_char('\n')
        
        li $a0, -100
        li $a1, 4
        jal xtoy            # xtoy(-100, 4)
        
        or $a0, $0, $v0
        li $v0, 1
        syscall             # print_int10(xtoy(-100, 4))
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
