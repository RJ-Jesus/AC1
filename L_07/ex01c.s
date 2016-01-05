				.data
str1:		.asciiz " - "
				.align 2
				.text
				.globl ex01c
ex01c:	#####
				# $s0 <- $a0 <- int argc
				# $s1 <- $a1 <- char *argv[]
				# $s2 <- int i
				# $s3 <- argv[i]
				#####

				addiu $sp, $sp, -20
				sw $s0, 0($sp)
				sw $s1, 4($sp)
				sw $s2, 8($sp)
				sw $s3, 12($sp)
				sw $ra, 16($sp)
				
				or $s0, $0, $a0
				or $s1, $0, $a1
				
				li $s2, 0							# i = 0
for1:		slt $t0, $s2, $s0			# for(*; i < argc; *)
				bne $t0, 1, done1
				
				li $a0, '\n'					# print_char('\n')
				li $v0, 11
				syscall
				
				sll $t0, $s2, 2				# i << 2
				addu $t0, $t0, $s1		# argv[0] + (i << 2)
				lw $s3, 0($t0)				# argv[i]
				
				la $a0, 0($s3)				# print_str(argv[i])
				li $v0, 4
				syscall
				
				la $a0, str1					# print_str(str)
				li $v0, 4
				syscall
				
				la $a0, 0($s3)				# strlen(argv[i])
				jal strlen
				
				or $a0, $0, $v0				# print_int10(strlen(argv[i]))
				li $v0, 1
				syscall
				
				addiu $s2, $s2, 1			# i++
				b for1
				
done1:	li $v0, 0
				lw $s0, 0($sp)
				lw $s1, 4($sp)
				lw $s2, 8($sp)
				lw $s3, 12($sp)
				lw $ra, 16($sp)
				addiu $sp, $sp, 20
				jr $ra