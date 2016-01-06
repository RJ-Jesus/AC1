				.text
				.globl ex04a
ex04a:	addiu $sp, $sp, -8
				sw $ra, 0($sp)
				sw $s0, 4($sp)
				
				li $a0, 2
				li $a1, 2
				jal div_					# div_(2, 2)
				or $s0, $0, $v0
				
				srl $a0, $s0, 16
				li $v0, 1
				syscall						# print_int10(2 % 2)
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				andi $a0, $s0, 0x0000FFFF
				li $v0, 1
				syscall						# print_int10(2 / 2)
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				li $a0, 11
				li $a1, 3
				jal div_					# div_(11, 3)
				or $s0, $0, $v0
				
				srl $a0, $s0, 16
				li $v0, 1
				syscall						# print_int10(11 % 3)
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				andi $a0, $s0, 0x0000FFFF
				li $v0, 1
				syscall						# print_int10(11 / 3)
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				li $a0, 29
				li $a1, 5
				jal div_					# div_(29, 5)
				or $s0, $0, $v0
				
				srl $a0, $s0, 16
				li $v0, 1
				syscall						# print_int10(29 % 5)
				
				li $a0, '\n'
				li $v0, 11
				syscall						# print_char('\n')
				
				andi $a0, $s0, 0x0000FFFF
				li $v0, 1
				syscall						# print_int10(29 / 5)
				
				li $v0, 0
				lw $ra, 0($sp)
				lw $s0, 4($sp)
				addiu $sp, $sp, 8
				jr $ra