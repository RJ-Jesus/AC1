        .data
list:   .word 0:10
str1:   .asciiz "Enter a number: "

        .text
        .globl main
main:   #####
        # $s0 <- i
        # $s1 <- j
        # $s2 <- aux
        # ###
        # $t0 <- list
        # $t1 <- list[i]
        # $t2 <- list[j]
        # $t3 <- &list[i]
        # $t4 <- &list[j]
        # ##
        # $t8 <- tmp1
        # $t9 <- tmp2
        #####
                                
        la $a0, list
        ori $a1, $0, 10
        jal fillArray

        la $t0, list
        ori $s0, $0, 0                  # i = 0
for1:   slti $t8, $s0, 9                # tmp1 = i < SIZE - 1
        bne $t8, 1, endfor1             # tmp1 != 1 ? endfor1 : continue
        addi $s1, $s0, 1                # j = i + 1
for2:   slti $t8, $s1, 10               # tmp1 = i < SIZE
        bne $t8, 1, endfor2             # tmp1 != 1 ? endfor2 : continue
        sll $t3, $s0, 2                 # &list[i]_t = i * 4
        add $t3, $t0, $t3               # &list[i] = list + &list[i]_t
        lw $t1, 0($t3)                  # list[i] = *(&list[i])
        sll $t4, $s1, 2                 # &list[j]_t = j * 4
        add $t4, $t0, $t4               # &list[j] = list + &list[j]_t
        lw $t2, 0($t4)                  # list[j] = *(&list[j])
        slt $t8, $t2, $t1               # tmp1 = list[j] < list[i]
        bne $t8, 1, endif3              # tmp1 != 1 ? endif3 : continue
        or $s2, $0, $t1                 # aux = list[i]
        sw $t2, 0($t3)                  # *list[i] = list[j]
        sw $s2, 0($t4)                  # *list[j] = aux
endif3:
        addi $s1, $s1, 1                # j++
        j for2
endfor2:
        addi $s0, $s0, 1                # i++
        j for1
endfor1:
        la $a0, list
        ori $a1, $0, 10
        jal printArray
        ori $v0, $0, 10
        syscall
                                
                                
fillArray:
        #####
        # $a0 <- arr
        # $a1 <- len(arr)
        # ###
        #       $s0 <- i
        # $s1 <- arr
        # $s2 <- len(arr)
        # ##
        # $t0 <- arr[i]
        # ##
        # $t8 <- tmp1
        # $t9 <- tmp2
        #####
        addi $sp, $sp, -12
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)

        move $s1, $a0
        move $s2, $a1
        ori $s0, $0, 0                  # i = 0
fA_for1:
        slt $t8, $s0, $s2               # tmp1 = i < len(arr)
        beq $t8, $0, fA_endfor1         # tmp1 == 0 ? continue : endfor1
        # print_str
        la $a0, str1
        ori $v0, $0, 4
        syscall
        # /
        # read_int
        ori $v0, $0, 5
        syscall
        # /
        sll $t0, $s0, 2                 # &arr[i]_t = i * 4
        add $t0, $s1, $t0               # &arr[i] = list + &arr[i]_t
        sw $v0, 0($t0)                  # arr[i] = read_int
        addi $s0, $s0, 1                # i++
        j fA_for1                       # loop fA_for1
fA_endfor1:
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        addi $sp, $sp 12
        jr $ra


printArray:
        #####
        # $a0 <- arr
        # $a1 <- len(arr)
        # ###
        #       $s0 <- &arr[i] for i = 0 to len(arr)
        # $s1 <- &len(arr)
        # $s2 <- &len(arr) - 4
        # ##
        # $t0 <- arr[i]
        # ##
        # $t8 <- tmp1
        # $t9 <- tmp2
        #####
        addi $sp, $sp, -12
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
                                
        move $s0, $a0
        sll $s1, $a1, 2
        add $s1, $s0, $s1
        # print_char
        ori $a0, $0, 91
        ori $v0, $0, 11
        syscall
        # /
        add $s2, $s1, -4
pA_for1:
        slt $t8, $s0, $s2               # tmp1 = &arr[i] < &arr[len - 1]
        beq $t8, $0, pA_endfor1         # tmp == 0 ? pA_endfor1 : continue
        # print_int
        lw $a0, 0($s0)
        ori $v0, $0, 1
        syscall
        # /
        # print_char
        ori $a0, $0, 32
        ori $v0, $0, 11
        syscall
        # /
        addi $s0, $s0, 4                # &arr[i] += 4
        j pA_for1
pA_endfor1:
        slt $t8, $s0, $s1               # tmp1 = &arr[i] < &arr[len]
        beq $t8, $0, pA_endif2          # tmp1 == 0 ? endif2 : continue
        # print_int
        lw $a0, 0($s0)
        ori $v0, $0, 1
        syscall
        # /
pA_endif2:
        # print_char
        ori $a0, $0, 93
        ori $v0, $0, 11
        syscall
        #/
        lw $s0, 0($sp)
        lw $s1, 4($sp)
        lw $s2, 8($sp)
        addi $sp, $sp 12
        jr $ra
