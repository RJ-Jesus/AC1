        .eqv SIZE, 3
        .data
array:  .word str1 str2 str3
str1:   .asciiz "Array"
str2:   .asciiz "de"
str3:   .asciiz "pointeiros"
str4:   .asciiz "\nString #"
str5:   .asciiz ": "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- array
        # $t1 <- int i
        # $t2 <- int j
        # $t3 <- array[i]
        # $t4 <- array[i][j]
        #####
        la $t0, array
        ori $t1, $0, 0          # i = 0
for1:   bge $t1, SIZE, done1    # for(*; i < SIZE; *)
        la $a0, str4            
        ori $v0, $0, 4
        syscall                 # print_str(str4)
        or $a0, $0, $t1         
        ori $v0, $0, 1
        syscall                 # print_int10(i)
        la $a0, str5      
        ori $v0, $0, 4
        syscall                 # print_str(str5)
        ori $t2, $0, 0          # j = 0
        sll $t3, $t1, 2
        addu $t3, $t0, $t3
        lw $t3, 0($t3)
while2: addu $t4, $t2, $t3      
        lb $t4, 0($t4)
        beq $t4, '\0', done2    # while(array[i][j] != '\0')
        or $a0, $0, $t4         
        ori $v0, $0, 11
        syscall                 # print_char(array[i][j])
        ori $a0, $0, '-'        
        ori $v0, $0, 11
        syscall                 # print_char('-')
        addi $t2, $t2, 1        # j++
        j while2
done2:  addi $t1, $t1, 1        # i++
        j for1
done1:  jr $ra
