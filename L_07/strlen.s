				.text
				.globl strlen
strlen:	#####
				# $a0 <- char *s
				# $v0 <- int len
				#####
				li $v0, 0							# len = 0
while1:	lb $t1, 0($a0)				# *s
				addiu $a0, $a0, 1			# s++
				beq $t1, '\0', done1	# while(*s != '\0')
				addiu $v0, $v0, 1			# len++
				b while1
done1:	jr $ra