        .text
        .globl print_int_ac1
print_int_ac1:
        #####
        # $a0 <- unsigned int val
        # $a1 <- unsigned int base
        #####
        addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        .data
buf:    .space 33
        .align 2
        .text
        la $a2, buf
        jal itoa          
        or $a0, $0, $v0   
        li $v0, 4
        syscall             # print_str(itoa(val, base, buf))
        
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
