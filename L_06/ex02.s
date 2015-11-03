		.eqv SIZE, 3
		.data
array: .word str1 str2 str3
	str1:	.asciiz "Array"
	str2:	.asciiz "de"
	str3:	.asciiz "pointeiros"
.align 2

		.text
		.globl main
main:	#####
		# $t0 <- p
		# $t1 <- last
		#####
		la $t0, array
		ori $t1, $0, SIZE		# tmp1 = SIZE
		sll $t1, $t1, 2			# tmp1 = tmp1 << 2
		add $t1, $t0, $t1		# last = p + tmp1
for1:	bge $t0, $t1, endfor1	# for(; p < last; *)
		lw $a0, 0($t0)			# print_str(*p)
		ori $v0, $0, 4
		syscall
		ori $a0, $0, '\n'		# print_char('\n')
		ori $v0, $0, 11
		syscall
		addi $t0, $t0, 4		# for(; *; p++)
		j for1
endfor1:
		ori $v0, $0, 10			# exit
		syscall
