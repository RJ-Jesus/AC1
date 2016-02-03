        .data
str:    .space 20
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int num
        # $t1 <- int i
        # $t2 <- str
        # $t3 <- &str[i]
        # $t4 <- str[i]
        #####
        la $a0, str 
        ori $a1, $0, 20
        ori $v0, $0, 8
        syscall               # read_str(str, 20)
    
        ori $t0, $0, 0        # num = 0
        ori $t1, $0, 0        # i = 0
        la $t2, str
    
while:  add $t3, $t1, $t2
        lb $t4, 0($t3)
        beq $t4, '\0', done   # while(str[i] != '\0')
        
        blt $t4, '0', fi      # if(str[i] >= '0' && \
        bgt $t4, '9', fi      # str[i] <= '9')
        addi $t0, $t0, 1      # num++
fi:     addi $t1, $t1, 1
        b while
done:   or $a0, $0, $t0
        li $v0, 1
        syscall               # print_int10(num)
        jr $ra
