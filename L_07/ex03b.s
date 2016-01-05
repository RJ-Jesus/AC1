				.eqv STR_MAX_SIZE 10
				.data
buf:		.space STR_MAX_SIZE
				.ascii "\0"
str1:		.asciiz "String too long. Nothing done!\n"
				.align 2
				.text
				.globl ex03b
ex03b:	#####
				# $a0 <- int argc
				# $a1 <- char *argv[]
				# $s0 <- argv[0]
				#####
				or $v0, $0, $0
				bne $a0, 1, fi1			# if(argc == 1)
				
				addiu $sp, $sp, -8
				sw $s0, 0($sp)
				sw $ra, 4($sp)
				
				lw $s0, 0($a1)			# argv[0]
				
				la $a0, 0($s0)
				jal strlen					# strlen(argv[0])
				
				bgt $v0, STR_MAX_SIZE, else2
				la $a0, buf
				la $a1, 0($s0)
				jal strcpy					# strcpy(buf, argv[0])
				
				la $a0, buf					# print_str(buf)
				li $v0, 4
				syscall
				
				or $v0, $0, $0
				b fi2
else2:	la $a0, str1				# print_str(str1)
				li $v0, 4
				syscall

				li $v0, 1
fi2:		lw $s0, 0($sp)
				lw $ra, 4($sp)
				addiu $sp, $sp, 8
fi1:		jr $ra
