        .data
str1:   .asciiz "S� para chatear"
str2:   .asciiz "AC1 - aulas pr�ticas"
        .align 2
        .text
        .globl main
main:   la $a0, str2
        ori $v0, $0, 4
        syscall           # print_str(str2)
        jr $ra
