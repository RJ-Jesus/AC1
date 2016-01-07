				.data
count:	.word 0
str1:		.asciiz " - Mover disco de topo de "
str2:		.asciiz " para "
				.align 2
				.text
				.globl tohanoi
tohanoi:
				#####
				# $a0 <- int n
				# $a1 <- int p1
				# $a2 <- int p2
				# $a3 <- int p3
				#####
				addiu $sp, $sp, -20
				sw $a0, 0($sp)
				sw $a1, 4($sp)
				sw $a2, 8($sp)
				sw $a3, 12($sp)
				sw $ra, 16($sp)
				beq $a0, 1, else1
				addi $a0, $a0, -1
				lw $a2, 12($sp)
				lw $a3, 8($sp)
				jal tohanoi							# tohanoi(n-1, p1, p3, p2)
				lw $a0, 4($sp)
				lw $a1, 8($sp)
				lw $a2, count
				addiu $a2, $a2, 1				# ++count
				sw $a2, count
				jal print_msg						# print_msg(p1, p2, ++count)
				lw $a0, 0($sp)
				addi $a0, $a0, -1
				lw $a1, 12($sp)
				lw $a2, 8($sp)
				lw $a3, 4($sp)
				jal tohanoi							# tohanoi(n-1, p3, p2, p1)
				b fi1
else1:	lw $a0, 4($sp)
				lw $a1, 8($sp)
				lw $a2, count
				addiu $a2, $a2, 1				# ++count
				sw $a2, count
				jal print_msg						# print_msg(p1, p2, ++count)
fi1:		lw $ra, 16($sp)
				addiu $sp, $sp, 20
				jr $ra


print_msg:
				#####
				# $a0 <- int t1
				# $a1 <- int t2
				# $a2 <- int cnt
				#####
				addiu $sp, $sp, -16
				sw $a0, 0($sp)
				sw $a1, 4($sp)
				sw $a2, 8($sp)
				sw $ra, 12($sp)
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				lw $a0, 8($sp)
				li $a1, 10
				jal print_int_ac1			# print_int_ac1(cnt, 10)
				la $a0, str1
				li $v0, 4
				syscall								# print_str(str1)
				lw $a0, 0($sp)
				li $a1, 10
				jal print_int_ac1			# print_int_ac1(t1, 10)
				la $a0, str2
				li $v0, 4
				syscall								# print_str(str2)
				lw $a0, 4($sp)
				li $a1, 10
				jal print_int_ac1			# print_int_ac1(t2, 10)
				lw $ra, 12($sp)
				addiu $sp, $sp, 16
				jr $ra