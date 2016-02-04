        .eqv SIZE 3
        .data
array:  .word str1 str2 str3
str1:   .asciiz "Array"
str2:   .asciiz "de"
str3:   .asciiz "pointeiros"
str4:   .asciiz "String #"
str5:   .asciiz ": "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- char **p
        # $t1 <- char **plast
        # $t3 <- char *pchar
        # $t4 <- int i
        #####
        la $t0, array           # p = array
        ori $t1, $0, SIZE     
        sll $t1, $t1, 2       
        addu $t1, $t0, $t1      # plast = p + SIZE
        li $t4, 0               # i = 0
for1:   bge $t0, $t1, done1     # for(*; p < last; *)
        la $a0, str4      
        ori $v0, $0, 4
        syscall                 # print_str(str4)
        or $a0, $0, $t4
        li $v0, 1
        syscall                 # print_int10(i)
        la $a0, str5
        li $v0, 4
        syscall                 # print_str(str5)
        lw $t3, 0($t0)          # pchar = *p
while2: lb $a0, 0($t3)        
        beq $a0, '\0', done2    # while(*pchar != '\0')
        ori $v0, $0, 11
        syscall                 # print_char(*pchar)
        ori $a0, $0, '-'        # print_char('-')
        ori $v0, $0, 11
        syscall
        addiu $t3, $t3, 1       # pchar++
        j while2
done2:  ori $a0, $0, '\n'
        ori $v0, $0, 11
        syscall                 # print_char('\n')
        addiu $t0, $t0, 4       # p++
        addi $t4, $t4, 1        # i++
        j for1
done1:  jr $ra
