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
        # $t0 <- char **p
        # $t1 <- char **pultimo
        #####
        la $t0, array         # p = array
        ori $t1, $0, SIZE   
        sll $t1, $t1, 2     
        add $t1, $t0, $t1     # pultimo = array + SIZE
for:    bge $t0, $t1, done    # for(; p < pultimo; *)
        lw $a0, 0($t0)        
        ori $v0, $0, 4
        syscall               # print_str(*p)
        ori $a0, $0, '\n'     
        ori $v0, $0, 11
        syscall               # print_char('\n')
        addi $t0, $t0, 4      # p++
        j for
done:   jr $ra
