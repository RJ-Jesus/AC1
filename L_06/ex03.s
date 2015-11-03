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
		# $t0 <- array
		# $t1 <- i
		# $t2 <- j
		# $t3 <- array[i]
		# $t4 <- *array[i][j]
		#####
		la $t0, array
		ori $t1, $0, 0			# for(i = 0; *; *)
for1:	bge $t1, SIZE, eFor1	# for(*; i < SIZE; *)
		la $a0, str4			# print_str(str4)
		ori $v0, $0, 4
		syscall
		or $a0, $0, $t1			# print_int10(i)
		ori $v0, $0, 1
		syscall
		la $a0, str5			# print_str(str5)
		ori $v0, $0, 4
		syscall
		sll $t3, $t1, 2			# tmp1 = i << 2
		add $t3, $t0, $t3		# tmp1 = array + tmp1
		lw $t3, 0($t3)			# array[i] = *tmp1
		ori $t2, $0, 0			# j = 0
while2:	add $t4, $t2, $t3		# tmp1 = j + array[i]
		lb $t4, 0($t4)			# array[i][j] = *tmp1
		beq $t4, '\0', eWhile2	# array[i][j] == '\0' ? eWhile2 : continue
		or $a0, $0, $t4			# print_char(array[i][j])
		ori $v0, $0, 11
		syscall
		ori $a0, $0, '-'		# print_char('-')
		ori $v0, $0, 11
		syscall
		addi $t2, $t2, 1		# j++
		j while2
eWhile2:addi $t1, $t1, 1		# for(*; *; i++)
		j for1
eFor1:
		ori $v0, $0, 10			# exit
		syscall
