        .data
str1:   .asciiz "Introduza 2 números: "
str2:   .asciiz "A soma dos dois números é: "
        .align 2
        .text
        .globl main
main:   la $a0, str1
        ori $v0, $0, 4
        syscall             # print_str(str1)
      
        ori $v0, $0, 5
        syscall
        or $t0, $0, $v0     # a = read_int()
      
        ori $v0, $0, 5
        syscall
        or $t1, $0, $v0     # b = read_int()
      
        la $a0, str2
        ori $v0, $0, 4
        syscall             # print_str(str2)
      
        add $a0, $t0, $t1
        ori $v0, $0, 1
        syscall             # print_int(a+b)
      
        jr $ra
