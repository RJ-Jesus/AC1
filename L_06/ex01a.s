        .eqv SIZE, 3
        .data
array:  .word str1 str2 str3
str1:   .asciiz "Array"
str2:   .asciiz "de"
str3:   .asciiz "pointeiros"
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- array
        # $t1 <- int i
        # $t2 <- array[i]
        #####
        la $t0, array
        ori $t1, $0, 0        # i = 0
for:    bge $t1, SIZE, done   # for(*; i < SIZE; *)
        sll $t2, $t1, 2     
        addu $t2, $t0, $t2  
        lw $a0, 0($t2)        
        ori $v0, $0, 4
        syscall               # print_str(array[i])
        ori $a0, $0, '\n'     
        ori $v0, $0, 11
        syscall               # print_char('\n')
        addi $t1, $t1, 1      # i++
        j for
done:   jr $ra
