        .data
str1:   .asciiz "Introduza um número: "
str2:   .asciiz "O valor em binário: "
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
        bne $t5, $0, else1          # if(bit == 0)
        ori $a0, $0, '0'            
        ori $v0, $0, 11
        syscall                     # print_char('0')
        b fi1
else1:  ori $a0, $0, '1'            
        ori $v0, $0, 11
        syscall                     # print_char('1')
fi1:    addi $t5, $t6, 1
        rem $t5, $t5, 4             
        bne $t5, $0, fi2            # if(!((i+1) % 4))
        ori $a0, $0, ' '
        ori $v0, $0, 11
        syscall                     # print_char(' ')  // $v0 was already 11, but...
fi2:    sll $t0, $t0, 1             # value = value << 1
        addi $t6, $t6, 1            # i++
        b for
done:   jr $ra
