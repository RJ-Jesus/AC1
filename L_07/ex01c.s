        .data
str:    .asciiz " - "
        .align 2
        .text
        .globl ex01c
ex01c:  #####
        # $s0 <- $a0 <- int argc
        # $s1 <- $a1 <- char *argv[]
        # $s2 <- int i
        # $s3 <- argv[i]
        #####

        addiu $sp, $sp, -20
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $s3, 12($sp)
        sw $ra, 16($sp)
        or $s0, $0, $a0
        or $s1, $0, $a1
        
        li $s2, 0             # i = 0
for:    slt $t0, $s2, $s0     # for(*; i < argc; *)
        bne $t0, 1, done
        
        li $a0, '\n'          
        li $v0, 11
        syscall               # print_char('\n')
        
        sll $t0, $s2, 2       
        addu $t0, $t0, $s1    
        lw $s3, 0($t0)      
        la $a0, 0($s3)        
        li $v0, 4
        syscall               # print_str(argv[i])
        
        la $a0, str         
        li $v0, 4
        syscall               # print_str(str)
        
        la $a0, 0($s3)        
        jal strlen
        or $a0, $0, $v0       
        li $v0, 1
        syscall               # print_int10(strlen(argv[i]))
        
        addiu $s2, $s2, 1     # i++
        b for
        
done:   li $v0, 0
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $s3, 12($sp)
        lw $ra, 16($sp)
        addiu $sp, $sp, 20
        jr $ra
