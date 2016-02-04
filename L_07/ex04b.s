        .data
str1:   .asciiz "Arquitetura de "
str2:   .space 50
str3:   .asciiz "Computadores"
        .align 2
        .text
        .globl ex04b
ex04b:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str2
        la $a1, str1
        jal strcpy        # strcpy(str2, str1)
        la $a0, str2
        la $a1, str3
        jal strcat
        or $a0, $0, $v0
        li $v0, 4
        syscall           # print_str(strcat(str2, str3))
        
        or $v0, $0, $0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
