        # student
        #   unsigned int  0   4
        #   char          4   18
        #   char          22  15
        #   float         40  4
        .data
stg:    .word 72343
        .ascii "Maria"
        .space 13
        .ascii "Simplesmente"
        .space 3
        .float 17.9
str1:   .asciiz "\nN. Mec: "
str2:   .asciiz "\nNome: "
str3:   .asciiz "\nNota: "
        .align 2
        .text
        .globl ex01a
ex01a:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        la $a0, str1
        li $v0, 4
        syscall                   # print_str(str1)
        lw $a0, stg
        li $v0, 36
        syscall                   # print_intu10(stg.id_number)
        la $a0, str2
        li $v0, 4
        syscall                   # print_str(str2)
        la $a0, stg+22
        li $v0, 4
        syscall                   # print_str(stg.last_name)
        li $a0, ','
        li $v0, 11
        syscall                   # print_char(',')
        la $a0, stg+4
        li $v0, 4
        syscall                   # print_str(stg.first_name)
        la $a0, str3
        li $v0, 4
        syscall                   # print_str(str3)
        lw $v0, stg+40
        mtc1 $v0, $f12
        li $v0,2
        syscall                   # print_float(stg.grade)
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
