				.data
str:		.asciiz "String de teste"
				.text
				.globl ex01b
ex01b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				
				la $a0, str				# arg0 = str
				jal strlen				# strlen(str)
				
				or $a0, $0, $v0		# print_int10(strlen(str))
				li $v0, 1
				syscall
				
				li $v0, 0
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra