				.data
src:		.asciiz "String to be copied"
dst:		.space 20
				.align 2
				.text
				.globl ex02b
ex02b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				
				la $a0, dst
				la $a1, src
				jal strcpy					# strcpy(dst, src)
				
				or $a0, $0, $v0
				li $v0, 4
				syscall							# print_str(strcpy(dst, src))
				
				li $v0, 0
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra