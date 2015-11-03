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
		# $t0 <- array
		# $t1 <- i
		# $t2 <- array[i]
		#####
		la $t0, array
		ori $t1, $0, 0			# for(i = 0; *; *)
for1:	bge $t1, SIZE, endfor1	# for(*; i < SIZE; *)
		sll $t2, $t1, 2			# tmp1 = i << 2
		add $t2, $t0, $t2		# array[i] = array + tmp1
		lw $a0, 0($t2)			# print_str(array[i])
		ori $v0, $0, 4
		syscall
		ori $a0, $0, '\n'		# print_char('\n')
		ori $v0, $0, 11
		syscall
		addi $t1, $t1, 1		# for(*; *; i++)
		j for1
endfor1:
		ori $v0, $0, 10			# exit
		syscall
