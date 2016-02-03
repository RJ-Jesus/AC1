        .data
str1:   .asciiz "Introduza dois números:\n"
str2:   .asciiz "Resultado: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 - int res
        # $t1 - int i
        # $t2 - int mdor
        # $t3 - int mdo
        #####
        ori $t0, $0, 0              # res = 0
        ori $t1, $0, 0              # i = 0
    
        la $a0, str1
        ori $v0, $0, 4
        syscall                     # print_str(str1)

        ori $v0, $0, 5
        syscall
        or $t2, $0, $v0             # mdor = read_int()
    
        ori $v0, $0, 5
        syscall
        or $t3, $0, $v0             # mdo = read_int()
    
while:  beq $t2, $0, done           # while(mdor != 0 && \
        slti $t4, $t1, 4            
        addi $t1, $t1, 1    
        beq $t4, $0, done           # i++ < 4)
        andi $t4, $t2, 0x00000001
        beq $t4, $0, fi             # if(mdor & 0x00000001)
        add $t0, $t0, $t3           # res = res + mdo
fi:     sll $t3, $t3, 1             # mdo = mdo << 1
        sra $t2, $t2, 1             # mdor = mdor >> 1
        b while

done:   la $a0, str2
        ori $v0, $0, 4
        syscall                     # print_str(str2)
    
        or $a0, $0, $t0
        ori $v0, $0, 1
        syscall                     # print_int10(res)
        jr $ra
