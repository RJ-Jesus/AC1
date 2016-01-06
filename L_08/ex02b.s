				.data
str1:		.space 5
str2:		.space 12
				.align 2
				.text
				.globl ex02b
ex02b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				
				li $a0, 2016
				li $a1, 10
				la $a2, str1
				jal itoa					# itoa(2016, 10, str1)
				la $a0, str1			# print_str(itoa(2016, 10, str1))
				li $v0, 4
				syscall
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				li $a0, 2016
				li $a1, 2
				la $a2, str2
				jal itoa					# itoa(2016, 2, str1)
				la $a0, str2			# print_str(itoa(2016, 2, str1))
				li $v0, 4
				syscall
				
				or $v0, $0, $0
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra