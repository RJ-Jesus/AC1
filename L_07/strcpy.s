				.text
				.globl strcpy
strcpy:	#####
				# $a0 <- char *dst
				# $a1 <- char *src
				# $t0 <- int i
				# $v0 <- dst
				#####
				li $t0, 0								# i = 0
do1:		addu $t1, $a1, $t0			# &src[i]
				lb $t1, 0($t1)					# src[i]
				addu $t2, $a0, $t0			# dst[i]
				sb $t1, 0($t2)					# dst[i] = src[i]
				beq $t1, '\0', done1		# while(src[i] != '\0')
				addiu $t0, $t0, 1				# i++
				b do1
done1:	or $v0, $0, $a0
				jr $ra