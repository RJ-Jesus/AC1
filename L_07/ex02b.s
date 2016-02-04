        .data
str:    .asciiz "String de teste"
        .text
        .globl ex02b
ex02b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str     
        jal strrev    
        or $a0, $0, $v0   
        li $v0, 4
        syscall             # print_str(strrev(str))
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
