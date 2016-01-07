				.text
				.globl strlen
strlen:	#####
				# $s0 <- $a0 <- char *s
				#####
				lb $t0, 0($a0)						# *s
				beqz $t0, else1						# if(*s != '\0')
				addiu $sp, $sp, -8
				sw $s0, 0($sp)
				sw $ra, 4($sp)
				or $s0, $0, $a0
				
				addiu $a0, $a0, 1
				jal strlen								# strlen(s+1)
				
				addiu $v0, $v0, 1
				lw $s0, 0($sp)
				lw $ra, 4($sp)
				addiu $sp, $sp, 8
				jr $ra
				
else1:	li $v0, 0
				jr $ra
				
				
				
				