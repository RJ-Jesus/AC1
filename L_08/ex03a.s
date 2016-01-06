				.data
str1:		.asciiz "\nOperação desconhecida"
str2:		.asciiz "\nNúmero de argumentos errado"
				.align 2
				.text
				.globl ex03a
ex03a:	#####
				# $a0 <- int argc
				# $s0 <- $a1 <- char *argv[]
				# $s1 <- int val1
				# $s2 <- int val2
				# $s3 <- int res
				# $s4 <- int exit_code
				# $s5 <- char op
				#####
				addiu $sp, $sp, -28
				sw $s0, 0($sp)
				sw $s1, 4($sp)
				sw $s2, 8($sp)
				sw $s3, 12($sp)
				sw $s4, 16($sp)
				sw $s5, 20($sp)
				sw $ra, 24($sp)
				or $s0, $0, $a1
				
				or $s4, $0, 0						# exit_code = 0
				bne $a0, 3, else1				# if(argc == 3)

				lw $a0, 0($s0)
				jal atoi								# atoi(argv[0])
				or $s1, $0, $v0					# val1 = atoi(argv[0])
				
				lw $a0, 8($s0)
				jal atoi								# atoi(argv[2])
				or $s2, $0, $v0					# val2 = atoi(argv[2])
				
				lw $s5, 4($s0)					# argv[1]
				lb $s5, 0($s5)					# op = argv[1][0]
				
if2:		bne $s5, 'x', ei2_2			# if(op == 'x')
				mul $s3, $s1, $s2				# res = val1 * val2
				b fi2
				
ei2_2:	bne $s5, '/', ei2_3			# else if(op == '/')
				div $s3, $s1, $s2				# res = val1 / val2
				b fi2
				
ei2_3:	bne $s5, '%', else2			# else if(op == '%')
				rem $s3, $s1, $s2				# res = val1 % val2
				b fi2

else2:	la $a0, str1
				li $v0, 4
				syscall									# print_str(str1)
				li $s4, 1								# exit_code = 1
				
fi2:		b fi1

else1:	la $a0, str2
				li $v0, 4
				syscall									# print_str(str2)
				li $s4, 2								# exit_code = 2

fi1:		bne $s4, 0, fi3					# if(exit_code == 0)
				or $a0, $0, $s1
				li $a1, 10
				jal print_int_ac1				# print_int_ac1(val1, 10)
				
				or $a0, $0, $s5
				li $v0, 11
				syscall									# print_char(op)
				
				or $a0, $0, $s2
				li $a1, 10
				jal print_int_ac1				# print_int_ac1(val2, 10)
				
				li $a0, '='
				li $v0, 11
				syscall									# print_char('=')
				
				or $a0, $0, $s3
				li $a1, 10
				jal print_int_ac1				# print_int_ac1(res, 10)
fi3:		or $v0, $0, $s4
				lw $s0, 0($sp)
				lw $s1, 4($sp)
				lw $s2, 8($sp)
				lw $s3, 12($sp)
				lw $s4, 16($sp)
				lw $s5, 20($sp)
				lw $ra, 24($sp)
				addiu $sp, $sp, -28
				jr $ra