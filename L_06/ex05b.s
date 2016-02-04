        .data
str1:   .asciiz "No of parameters: "
str2:   .asciiz " - "
str3:   .asciiz "  Letters: "
str4:   .asciiz "  Characters: "
str5:   .asciiz "Biggest word: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- $a0 <- int argc
        # $a1 <- char *argv[]
        # $t1 <- int maxSize
        # $t2 <- int letters
        # $t4 <- int i
        # $t5 <- int j
        # $t6 <- char *maxString
        # $t7 <- argv[i]
        # $t8 <- argv[i][j]
        #####
        or $t0, $0, $a0
        la $a0, str1
        li $v0, 4
        syscall               # print_str(str1)
        or $a0, $0, $t0
        li $v0, 1
        syscall               # print_int10(argc)
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        li $t1, 0             # maxSize = 0
        li $t4, 0             # i = 0
for1:   bge $t4, $t0, done1   # for(*; i < argc; *)
        addi $a0, $t4, 1
        li $v0, 1
        syscall               # print_int10(i+1)
        la $a0, str2
        li $v0, 4
        syscall               # print_str(str2)
        sll $t7, $t4, 2
        addu $t7, $a1, $t7
        lw $t7, 0($t7)
        or $a0, $0, $t7
        li $v0, 4
        syscall               # print_str(argv[i])
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        li $t2, 0             # letters = 0
        li $t5, 0             # j = 0
while2: addu $t8, $t5, $t7
        lb $t8, 0($t8)
        beq $t8, $0, done2    # while(argv[i][j] != '\0')
        blt $t8, 'A', elif1   # if((argv[i][j] >= 'A' && \
        ble $t8, 'Z', if1     # argv[i][j] <= 'Z') || \
elif1:  blt $t8, 'a', fi1     # (argv[i][j] >= 'a' && \
        bgt $t8, 'z', fi1     # argv[i][j] <= 'z')
if1:    addi $t2, $t2, 1      # letters++
fi1:    addi $t5, $t5, 1      # j++
        b while2
done2:  ble $t5, $t1, fi2     # if(j > maxSize)
        or $t6, $0, $t7       # maxString = argv[i]
        or $t1, $0, $t5       # maxSize = j
fi2:    la $a0, str3
        li $v0, 4
        syscall               # print_str(str3)
        or $a0, $0, $t2
        li $v0, 1
        syscall               # print_int10(letters)
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        la $a0, str4
        li $v0, 4
        syscall               # print_str(str4)
        or $a0, $0, $t5
        li $v0, 1
        syscall               # print_int10(j)
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
        addi $t4, $t4, 1      # i++
        b for1
done1:  beq $t1, $0, fi3      # if(maxSize)
        la $a0, str5
        li $v0, 4
        syscall               # print_str(str5)
        or $a0, $0, $t6
        li $v0, 4
        syscall               # print_str(maxString)
        li $a0, '\n'
        li $v0, 11
        syscall               # print_char('\n')
fi3:    jr $ra
        
