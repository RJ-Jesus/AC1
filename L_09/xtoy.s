				.text
				.globl xtoy
xtoy:		#####
				# $a0 <- int x
				# $a1 <- unsigned int y
				#####
				beqz $a1, fi1
				addiu $sp, $sp, -8
				sw $a0, 0($sp)
				sw $ra, 4($sp)
				
				subu $a1, $a1, 1
				jal xtoy						# xtoy(x, y-1)
				
				lw $t0, 0($sp)
				mul $v0, $v0, $t0
				lw $ra, 4($sp)
				addiu $sp, $sp, 8
				jr $ra
fi1:		li $v0, 1
				jr $ra