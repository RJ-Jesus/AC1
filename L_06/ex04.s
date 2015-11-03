		.data
str1:	.asciiz "Nr. de parâmetros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
.align 2

		.text
		.globl main
main:	#####
		# $t0 <- argc
		# $a1 <- argv
		# $t1 <- i
		#####
		or $t0, $0, $a0			# $t0 <- $a0
		la $a0, str1			# print_str(str1)
		ori $v0, $0, 4
		syscall
		or $a0, $0, $t0			# print_int10(argc)
		ori $v0, $0, 1
		syscall
		ori $t1, $0, 0			# for(i = 0; *; *)
for1:	bge $t1, $t0, endfor1	# for(*; i < argc; *)
		la $a0, str2			# print_str(str2)
		ori $v0, $0, 4
		syscall
		or $a0, $0, $t1			# print_int10(i)
		ori $v0, $0, 1
		syscall
		la $a0, str3			# print_str(str3)
		ori $v0, $0, 4
		syscall
		sll $a0, $t1, 2			# tmp1 = i << 2
		add $a0, $a0, $a1		# tmp1 = tmp1 + argv
		lw $a0, 0($a0)			# print_str(argv[i])
		ori $v0, $0, 4
		syscall
		addi $t1, $t1, 1		# for(*; *; i++)
		j for1
endfor1:
		ori $v0, $0, 0
		jr $ra