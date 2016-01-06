				.text
				.globl print_int_ac1
print_int_ac1:
				#####
				# $a0 <- unsigned int val
				# $a1 <- unsigned int base
				#####
				addiu $sp, $sp, -4
				sw $ra, 0($sp)
				
				.data
buf:		.space 33
				.text
				la $a2, buf
				jal itoa					# itoa(val, base, buf)
				or $a0, $0, $v0		# print_str(itoa(val, base, buf))
				li $v0, 4
				syscall
				
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra