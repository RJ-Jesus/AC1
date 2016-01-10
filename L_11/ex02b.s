				.data
d:			.double 2 4 100
				.text
				.globl ex02b
ex02b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				ldc1 $f12, d
				jal sqrt							# sqrt(2)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(sqrt(2))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				ldc1 $f12, d+8
				jal sqrt							# sqrt(4)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(sqrt(4))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				ldc1 $f12, d+16
				jal sqrt							# sqrt(100)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(sqrt(100))
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra