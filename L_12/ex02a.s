        # student
        #   unsigned int  0   4
        #   char          4   18
        #   char          22  15
        #   float         40  4
        .eqv MAX_STUDENTS 4
        .data
st_array:
        .space 176
media:  .float 0.0
str1:   .asciiz "\nMédia: "
        .align 2
        .text
        .globl ex02a
ex02a:  #####
        # $s0 <- student *pmax
        #####
        addiu $sp, $sp, -8
        sw $s0, 0($sp)
        sw $ra, 4($sp)
        
        la $a0, st_array
        li $a1, MAX_STUDENTS
        jal read_data               # read_data(st_array, MAX_STUDENTS)
        
        la $a0, st_array
        li $a1, MAX_STUDENTS
        la $a2, media
        jal max
        or $s0, $0, $v0             # pmax = max(st_array, MAX_STUDENTS, &media)
        
        la $a0, str1
        li $v0, 4
        syscall                     # print_str(str1)
        
        l.s $f12, media
        li $v0, 2
        syscall                     # print_float(media)
        
        or $a0, $0, $s0
        jal print_student           # print_student(pmax)
        
        li $v0, 0
        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addiu $sp, $sp, 8
        jr $ra
