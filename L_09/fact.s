				.text
				.globl fact
fact:		#####
				# $a0 <- unsigned int n
				#####
				bleu $a0, 12, fi1
				li $a0, 1
				li $v0, 17
				syscall								# exit(1)
fi1:		addiu $sp, $sp, -8
				sw $a0, 0($sp)
				sw $ra, 4($sp)
				
				bleu $a0, 1, else2		# if(n > 1)
				addiu $a0, $a0, -1
				jal fact							# fact(n - 1)
				
				lw $t0, 0($sp)
				mulu $v0, $v0, $t0
				b fi2
else2:	li $v0, 1
fi2:		lw $ra, 4($sp)
				addiu $sp, $sp, 8
				jr $ra