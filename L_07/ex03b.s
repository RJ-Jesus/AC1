        .eqv STR_MAX_SIZE 10
        .data
buf:    .space STR_MAX_SIZE
        .ascii "\0"
str:    .asciiz "String too long. Nothing done!\n"
        .align 2
        .text
        .globl ex03b
ex03b:  #####
        # $a0 <- int argc
        # $a1 <- char *argv[]
        # $s0 <- argv[0]
        #####
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        
        li $v0, 0
        bne $a0, 1, fi1                 # if(argc == 1)
        
        lw $s0, 0($a1)
        
        or $a0, $0, $s0
        jal strlen      
        bgt $v0, STR_MAX_SIZE, else2    # if(strlen(argv[0] <= STR_MAX_SIZE)
        la $a0, buf
        or $a1, $0, $s0
        jal strcpy                      # strcpy(buf, argv[0])
        
        la $a0, buf         
        li $v0, 4
        syscall                         # print_str(buf)
        
        or $v0, $0, $0
        b fi1
else2:  la $a0, str                     # print_str(str)
        li $v0, 4
        syscall

        li $v0, 1
        
fi1:    lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
