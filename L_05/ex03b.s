        .eqv SIZE 10
        .data
lista:  .word 0:SIZE
str:    .asciiz "Introduza um número: "
        .align 2
        .text
        .globl main
main:   #####
        # $t0 <- int houveTroca
        # $t1 <- int i
        # $t2 <- lista
        # $t3 <- &lista[i]
        # $t4 <- int aux = lista[i]
        # $t5 <- lista[i + 1]
        #####
        addiu $sp, $sp, -4
        sw $ra, 0($sp)
        
        la $a0, lista
        ori $a1, $0, SIZE
        jal fillArray             # fillArray(lista, SIZE)
        
        la $t2, lista
do1:    li $t0, 0                 # houveTroca = FALSE
        li $t1, 0                 # i = 0
for2:   bge $t1, 9, done2         # for(*; i < SIZE-1; *)
        sll $t3, $t1, 2
        addu $t3, $t2, $t3
        lw $t4, 0($t3)
        lw $t5, 4($t3)
        ble $t4, $t5, fi          # if(lista[i] > lsita[i+1])
        sw $t5, 0($t3)            # lista[i] = lista[i + 1]
        sw $t4, 4($t3)            # lista[i + 1] = aux
        li $t0, 1                 # houveTroca = 1
fi:     addi $t1, $t1, 1          # i++
        b for2
done2:  beq $t0, $0, done1        # while(houveTroca == TRUE)
        b do1
done1:  or $a0, $0, $t2
        li $a1, SIZE
        jal printArray            # printArray(lista, SIZE)
        
        lw $ra, 0($sp)
        addiu $sp, $sp, -4
        jr $ra
      
fillArray:
        #####
        # $s0 <- $a0 <- int *p
        # $s1 <- $a1 <- int n
        #####
        addiu $sp, $sp, -12
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $ra, 8($sp)
        or $s0, $0, $a0
        
        sll $s1, $a1, 2
        addu $s1, $s0, $s1
      
fA_for: bge $s0, $s1, fA_done
        la $a0, str
        ori $v0, $0, 4
        syscall                 # print_str(str)
        
        li $v0, 5
        syscall
        sw $v0, 0($s0)          # *p = read_int()
        addiu $s0, $s0, 4       # p++
        b fA_for
fA_done:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $ra, 8($sp)
        addiu $sp, $sp, 12
        jr $ra

printArray:
        #####
        # $s0 <- $a0 <- int *arr
        # $s1 <- $a1 <- int n
        # $s2 <- int i
        #####
        addi $sp, $sp, -16
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $ra, 12($sp)
        or $s0, $0, $a0
        or $s1, $0, $a1                        
        
        li $s2, 0               # i = 0
pA_for: bge $s2, $s1, pA_done   # for(*; i < n; i++)  

        sll $a0, $s2, 2
        addu $a0, $a0, $s0
        lw $a0, 0($a0)
        li $v0, 1
        syscall                 # print_int10(arr[i])
        
        li $a0, ','
        li $v0, 11
        syscall                 # print_char(',')
        
        addi $s2, $s2, 1        # i++
        b pA_for
pA_done:
        li $a0, '\n'
        li $v0, 11
        syscall                 # print_char('\n')
        
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        lw $ra, 12($sp)
        addi $sp, $sp, 16    
        jr $ra                                                                                                                                                                          
