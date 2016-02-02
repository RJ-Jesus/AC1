        .text
        .globl main
main:   ori $t0, $0, 0xAD12345E     # Set $t0 (value to shift)

        andi $a0, $t0, 0xF0000000   # $t0 & 0xF0000000
        srl $a0, $a0, 28            # ($t0 & 0xF0000000) >> 28
        li $v0, 34
        syscall                     # print_int16(($t0 & 0xF0000000) >> 28)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x0F000000   # $t0 & 0x0F000000
        srl $a0, $a0, 24            # ($t0 & 0xF0000000) >> 24
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x0F000000) >> 24)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x00F00000   # $t0 & 0x00F00000
        srl $a0, $a0, 20            # ($t0 & 0x00F00000) >> 20
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x00F00000) >> 20)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
          
        andi $a0, $t0, 0x000F0000   # $t0 & 0x000F0000
        srl $a0, $a0, 16            # ($t0 & 0x000F0000) >> 16
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x000F0000) >> 16)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x0000F000   # $t0 & 0x0000F000
        srl $a0, $a0, 12            # ($t0 & 0xF0000000) >> 12
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x0000F000) >> 12)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x00000F00   # $t0 & 0x00000F00
        srl $a0, $a0, 8             # ($t0 & 0x00000F00) >> 8
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x00000F00) >> 8)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x000000F0   # $t0 & 0x000000F0
        srl $a0, $a0, 4             # ($t0 & 0x000000F0) >> 4
        li $v0, 34
        syscall                     # print_int16(($t0 & 0x000000F0) >> 4)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        andi $a0, $t0, 0x0000000F   # $t0 & 0x0000000F
        li $v0, 34
        syscall                     # print_int16($t0 & 0x0000000F)
        li $a0, '\n'
        li $v0, 11
        syscall                     # print_char('\n')
        
        jr $ra
