				.data
ONE:		.double 1
				.text
				.globl xtoy
xtoy:		#####
				# $f20 <- $f12 <- double x
				# $s0 <- $a0 <- int y
				# $t0 <- int i
				# $f0 <- double result
				#####
				addiu $sp, $sp, -16
				swc1 $f20, 0($sp)
				swc1 $f21, 4($sp)
				sw $s0, 8($sp)
				sw $ra, 12($sp)
				mov.d $f20, $f12
				or $s0, $0, $a0
				jal abs									# abs(y)
				or $t1, $0, $v0
				li $t0, 0								# i = 0
				ldc1 $f0, ONE						# result = 1.0
for1:		bge $t0, $t1, done1			# for(*; i < abs(y); *)
				blez $s0, else1
				mul.d $f0, $f0, $f20		# result *= x
				b fi1
else1:	div.d $f0, $f0, $f20		# result /= x
fi1:		addiu $t0, $t0, 1				# i++
				b for1
done1:	lwc1 $f20, 0($sp)
				lwc1 $f21, 4($sp)
				lw $s0, 8($sp)
				lw $ra, 12($sp)
				addiu $sp, $sp, 16
				jr $ra


abs:		#####
				# $a0 <- int val
				#####
				or $v0, $0, $a0
				bgez $v0, fi2						# if(val < 0)
				mul $v0, $v0, -1				# val = -val;
fi2:		jr $ra
