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
str1:   .asciiz "N. Mec: "
str2:   .asciiz "Primeiro nome: "
str3:   .asciiz "Último nome: "
str4:   .asciiz "Nota: "
str5:   .asciiz "\nN. Mec: "
str6:   .asciiz "\nNome: "
str7:   .asciiz "\nNota: "
        .align 2
        .text
        .globl ex01c
ex01c:  addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, str1
        li $v0, 4
        syscall                   # print_str(str1)
        li $v0, 5
        syscall
        sw $v0, stg               # stg.id_number = read_int()
        la $a0, str2
        li $v0, 4
        syscall                   # print_str(str2)
        la $a0, stg+4
        li $a1, 18
        li $v0, 8
        syscall                   # read_str(stg.first_name, 18)
        la $a0, str3
        li $v0, 4
        syscall                   # print_str(str3)
        la $a0, stg+22
        li $a1, 15
        li $v0, 8
        syscall                   # read_str(stg.last_name, 15)
        la $a0, str4
        li $v0, 4
        syscall                   # print_str(str4)
        li $v0, 6
        syscall
        s.s $f0, stg+40           # stg.grade = read_float()
        
        la $a0, str5
        li $v0, 4
        syscall                   # print_str(str5)
        lw $a0, stg
        li $v0, 36
        syscall                   # print_intu10(stg.id_number)
        la $a0, str6
        li $v0, 4
        syscall                   # print_str(str6)
        la $a0, stg+22
        li $v0, 4
        syscall                   # print_str(stg.last_name)
        li $a0, ','
        li $v0, 11
        syscall                   # print_char(',')
        la $a0, stg+4
        li $v0, 4
        syscall                   # print_str(stg.first_name)
        la $a0, str7
        li $v0, 4
        syscall                   # print_str(str7)
        lw $v0, stg+40
        mtc1 $v0, $f12
        li $v0,2
        syscall                   # print_float(stg.grade)
        
        li $v0, 0
        lw $ra, 0($sp)
        addiu $sp, $sp, 4
        jr $ra
