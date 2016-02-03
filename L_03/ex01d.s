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
        # $t8 <- int flag
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
    
        ori $t8, $0, 0              # flag  // for '1' found
        ori $t6, $0, 0              # i = 0
for:    bge $t6, 32, done           # for(*; i < 32; *)
        andi $t5, $t0, 0x80000000   # bit = value & 0x80000000
        or $t8, $t8, $t5            # flag |= bit
        beq $t8, $0, fi             # if(flag)
        srl $t5, $t5, 31
        addi $a0, $t5, '0'    
        ori $v0, $0, 11
        syscall                     # print_char('0' + bit[32])
        addi $t5, $t6, 1
        rem $t5, $t5, 4             
        bne $t5, $0, fi             # if(!((i+1) % 4))
        ori $a0, $0, ' '
        ori $v0, $0, 11
        syscall                     # print_char(' ')   // $v0 was already 11, but...
fi:     sll $t0, $t0, 1             # value = value << 1
        addi $t6, $t6, 1            # i++;
        b for
done:   bne $t8, $0, end            # if(!flag)
        ori $a0, $0, '0'
        ori $v0, $0, 11
        syscall                     # print_char('0')
end:    jr $ra
