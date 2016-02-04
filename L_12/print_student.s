        .text
        .globl print_student
print_student:
        #####
        # $s0 <- $a0 <- student *p
        #####
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        or $s0, $0, $a0
        
        lw $a0, 0($s0)
        li $v0, 36
        syscall               # print_intu10(p->id_number)
        
        la $a0, 4($s0)
        li $v0, 4
        syscall               # print_str(p->first_name)
        
        la $a0, 22($s0)
        li $v0, 4
        syscall               # print_str(p->last_name)
        
        l.s $f12, 40($s0)
        li $v0, 2
        syscall               # print_float(p->grade)
        
        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
