				.data
d1:			.double 2.5
d2:			.double 5
				.text
				.globl ex01b
ex01b:	addiu $sp, $sp, -4
				sw $ra, 0($sp)
				ldc1 $f12, d1
				li $a0, 10
				jal xtoy							# xtoy(d1, 10)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(xtoy(d1, 10))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				ldc1 $f12, d2
				li $a0, 5
				jal xtoy							# xtoy(d2, 5)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(xtoy(d2, 5))
				li $v0, 0
				lw $ra, 0($sp)
				addiu $sp, $sp, 4
				jr $ra