				.eqv n 11
				.data
arr:		.double 0:n
str1:		.asciiz "Fahrenheit: \n"
str2:		.asciiz "Celsius: \n"
str3:		.asciiz "Maximum: "
str4:		.asciiz "Median: "
str5:		.asciiz "Average: "
str6:		.asciiz "Variance: "
str7:		.asciiz "Standard Deviation: "
				.align 2
				.text
				.globl ex03c
ex03c:	#####
				# $s0 <- arr
				# $s1 <- int i
				#####
				addiu $sp, $sp, -12
				sw $s0, 0($sp)
				sw $s1, 4($sp)
				sw $ra, 8($sp)
				la $s0, arr
				la $a0, str1
				li $v0, 4
				syscall								# print_str(str1)
				li $s1, 0							# i = 0
for1:		bge $s1, n, done1			# for(*; i < n; *)
				li $v0, 5
				syscall								# read_int()
				sll $t0, $s1, 3				# i << 3
				addu $t0, $t0, $s0		# &arr[i]
				mtc1 $v0, $f12
				cvt.d.w $f12, $f12		# (double) read_int()
				jal f2c								# f2c((double) read_int())
				sdc1 $f0, 0($t0)			# arr[i] = f2c((double) read_int())
				addiu $s1, $s1, 1			# i++
				b for1
done1:	la $a0, str2
				li $v0, 4
				syscall								# print_str(str2)
				li $s1, 0							# i = 0
for2:		bge $s1, n, done2			# for(*; i < n; *)
				sll $t0, $s1, 3				# i << 3
				addu $t0, $t0, $s0		# &arr[i]
				ldc1 $f12, 0($t0)
				li $v0, 3
				syscall								# print_double(arr[i])
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				addiu $s1, $s1, 1			# i++
				b for2
done2:	la $a0, str3
				li $v0, 4
				syscall								# print_str(str3)
				or $a0, $0, $s0
				li $a1, n
				jal max								# max(arr, n)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(max(arr, n))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				la $a0, str4
				li $v0, 4
				syscall								# print_str(str4)
				or $a0, $0, $s0
				li $a1, n
				jal sort							# sort(arr, n)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(sort(arr, n))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				la $a0, str5
				li $v0, 4
				syscall								# print_str(str5)
				or $a0, $0, $s0
				li $a1, n
				jal average						# average(arr, n)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(average(arr, n))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				la $a0, str6
				li $v0, 4
				syscall								# print_str(str6)
				or $a0, $0, $s0
				li $a1, n
				jal var								# var(arr, n)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(var(arr, n))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				la $a0, str7
				li $v0, 4
				syscall								# print_str(str7)
				or $a0, $0, $s0
				li $a1, n
				jal stdev							# stdev(arr, n)
				mov.d $f12, $f0
				li $v0, 3
				syscall								# print_double(stdev(arr, n))
				li $a0, '\n'
				li $v0, 11
				syscall								# print_char('\n')
				li $v0, 0
				lw $s0, 0($sp)
				lw $s1, 4($sp)
				lw $ra, 8($sp)
				addiu $sp, $sp, 12
				jr $ra