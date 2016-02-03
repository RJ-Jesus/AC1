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
    
        ori $t2, $0, 8              # i = 8
while1: andi $t3, $t0, 0xF0000000 
        bne $t3, $0, do2            # while(value & 0xF0000000 && \
        beq $t2, $0, do2            #   i > 0)
        sll $t0, $t0, 4             # value = value << 4
        addi $t2, $t2, -1           # i--
        b while1
        
do2:    andi $t1, $t0, 0xF0000000 
        srl $t1, $t1, 28            # dígito = (value & 0xF0000000) >> 28
        slti $t3, $t1, 10         
        beq $t3, 0, else1           # if(dígito <= 9)
        addi $a0, $t1, '0'          
        ori $v0, $0, 11
        syscall                     # print_char(dígito + '0')
        b fi1
else1:  addi $a0, $t1, 55
        ori $v0, $0, 11
        syscall                     # print_char(dígito + '0' + 7)
fi1:    sll $t0, $t0, 4             # value = value << 4
        addi $t2, $t2, -1           # i--
        slti $t3, $t2, 1          
        bne $t3, $0, end            # while(i > 0)
        b do2
        
end:    jr $ra
