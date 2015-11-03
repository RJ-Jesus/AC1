		.eqv SIZE, 3
		.data
array: .word str1 str2 str3
	str1:	.asciiz "Array"
	str2:	.asciiz "de"
	str3:	.asciiz "pointeiros"
str4: .asciiz "\nString #"
str5: .asciiz ": "
.align 2

		.text
		.globl main
main:	#####
		# $t0 <- p
		# $t1 <- last
		# $t3 <- *p
		# $t4 <- array[i][j]
		#####
		la $t0, array
		ori $t1, $0, SIZE		# tmp1 = SIZE
		sll $t1, $t1, 2			# tmp1 = tmp1 << 2
		add $t1, $t0, $t1		# last = p + tmp1
for1:	bge $t0, $t1, eFor1		# for(*; p < last; *)
		la $a0, str4			# print_str(str4)
		ori $v0, $0, 4
		syscall
		lw $a0, 0($t0)			# print_str(array[i])
		ori $v0, $0, 4
		syscall
		la $a0, str5			# print_str(str5)
		ori $v0, $0, 4
		syscall
		lw $t3, 0($t0)			# array[i] = *p
while2:	lb $t4, 0($t3)			# array[i][j] = **p
		beq $t4, '\0', eWhile2	# while(array[i][j] != '\0')
		or $a0, $0, $t4			# print_char(array[i][j])
		ori $v0, $0, 11
		syscall
		ori $a0, $0, '-'		# print_char('-')
		ori $v0, $0, 11
		syscall
		addi $t3, $t3, 1		# j++
		j while2
eWhile2:addi $t0, $t0, 4		# for(*; *; p++)
		j for1
eFor1:
		ori $v0, $0, 10			# exit
		syscall
