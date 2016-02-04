        .data
str1:   .asciiz "Fahrenheit: "
str2:   .asciiz "Celsius: "
        .align 2
        .text
        .globl ex02b
ex02b:  #####
        # $f20 <- double ft
        #####
        addiu $sp, $sp, -12
        s.d $f20, 0($sp)
        sw $ra, 8($sp)
        la $a0, str1
        li $v0, 4
        syscall               # print_str(Str1)
        li $v0, 7
        syscall               # read_double()
        mov.d $f20, $f0       # ft = read_double()
        la $a0, str2
        li $v0, 4
        syscall               # print_str(str2)
        mov.d $f12, $f20
        jal f2c               # f2c(ft)
        mov.d $f12, $f0
        li $v0, 3
        syscall               # print_double(f2c(ft))
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        li $v0, 0
        l.d $f20, 0($sp)
        lw $ra, 8($sp)
        addiu $sp, $sp, 12
        jr $ra
