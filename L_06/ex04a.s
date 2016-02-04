        .data
str1:   .asciiz "Nr. de parâmetros: "
str2:   .asciiz "\nP"
str3:   .asciiz ": "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- $a0 <- int argc
        # $a1 <- char *argv[]
        # $t1 <- int i
        #####
        or $t0, $0, $a0     
        la $a0, str1      
        ori $v0, $0, 4
        syscall               # print_str(str1)
        or $a0, $0, $t0   
        ori $v0, $0, 1
        syscall               # print_int10(argc)
        ori $t1, $0, 0        # i = 0
for:    bge $t1, $t0, done    # for(*; i < argc; *)
        la $a0, str2          
        ori $v0, $0, 4
        syscall               # print_str(str2)
        or $a0, $0, $t1       # print_int10(i)
        ori $v0, $0, 1
        syscall
        la $a0, str3          
        ori $v0, $0, 4
        syscall               # print_str(str3)
        sll $a0, $t1, 2     
        addu $a0, $a0, $a1    
        lw $a0, 0($a0)  
        ori $v0, $0, 4
        syscall               # print_str(argv[i]
        addi $t1, $t1, 1      # i++
        j for
done:   ori $v0, $0, 0
        jr $ra
