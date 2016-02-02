        .text 
        .globl main 
main:   ori $v0, $0, 5
        syscall               # x = read_int()
        ori $t0, $0, 8        # $t0 = 8
        add $a0, $v0, $v0     # $a0 = x + x = 2 * x
        sub $a0, $a0, $t0     # $a0 = y = 2 * x - 8
        ori $v0, $0, 1
        syscall               # print_int10(y)
        jr $ra
