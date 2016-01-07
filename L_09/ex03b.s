				.data
arr:		.word 1 2 3 4 5 6 7 8 9 10
				.text
				.globl ex03b
ex03b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				
				li $t0, 10
				la $a0, arr
				or $a1, $0, $t0
				jal soma						# soma(arr, nelem)
				
				or $a0, $0, $v0
				li $v0, 1
				syscall							# print_int10(soma(arr, nelem))
				
				li $v0, 0
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra