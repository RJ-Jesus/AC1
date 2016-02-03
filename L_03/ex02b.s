        .data
str1:   .asciiz "Introduza um número: "
str2:   .asciiz "O valor em hexadecimal: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int value
        # $t1 <- int dígito
        # $t2 <- int i
        #####
    
        la $a0, str1
        ori $v0, $0, 4
        syscall                     # print_str(str1)

        ori $v0, $0, 5
        syscall
        or $t0, $0, $v0             # value = read_int()
    
        la $a0, str2
        ori $v0, $0, 4
        syscall                     # print_str(str2)
        
        andi $t3, $t0, 0xC0000000
        sll $t0, $t0, 2
        ori $t2, $0, 10             # i = 10
        
        beq $t3, $0, while1         # if(value[32:30])
        srl $a0, $t3, 30
        addi $a0, $a0, '0'
        ori $v0, $0, 11
        syscall                     # print_char(value[32:30] + '0')
    
while1: andi $t3, $t0, 0xE0000000 
        bne $t3, $0, do2            # while(value & 0xE0000000 && \
        beq $t2, $0, do2            #   i > 0)
        sll $t0, $t0, 3             # value = value << 3
        addi $t2, $t2, -1           # i--
        b while1
        
do2:    andi $t1, $t0, 0xE0000000 
        srl $t1, $t1, 29            # dígito = (value & 0xE0000000) >> 29
        addi $a0, $t1, '0'          
        ori $v0, $0, 11
        syscall                     # print_char(dígito + '0')
        sll $t0, $t0, 3             # value = value << 3
        addi $t2, $t2, -1           # i--
        slti $t3, $t2, 1          
        bne $t3, $0, end            # while(i > 0)
        b do2
        
end:    jr $ra
