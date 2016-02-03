        .data
str1:   .asciiz "Introduza um n�mero: "
str2:   .asciiz "O valor em bin�rio: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int value
        # $t5 <- int bit
        # $t6 <- int i
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
    
        ori $t6, $0, 0              # i = 0
for:    bge $t6, 32, done           # for(*; i < 32; *)
        andi $t5, $t0, 0x80000000   # bit = value & 0x80000000
        bne $t5, $0, else           # if(bit == 0)
        ori $a0, $0, '0'            
        ori $v0, $0, 11
        syscall                     # print_char('0')
        b fi
else:   ori $a0, $0, '1'            
        ori $v0, $0, 11
        syscall                     # print_char('1')
fi:     sll $t0, $t0, 1             # value = value << 1
        addi $t6, $t6, 1            # i++
        b for
done:   jr $ra
