				.text
				.globl strcpy2
strcpy2:
				#####
				# $a0 <- char *dst
				# $a1 <- char *src
				# $v0 <- char *p
				#####
				or $v0, $0, $a0					# p = dst
				
do1:		lb $t0, 0($a1)					# *src
				sb $t0, 0($a0)					# *dst = *src
				addiu $a0, $a0, 1				# dst++
				beq $t0, '\0', done1		# while(*src != '\0')
				addiu $a1, $a1, 1				# src++  // this is not actually translated from C, but it's more efficient and works too since src value is not used below
				b do1
done1:	jr $ra