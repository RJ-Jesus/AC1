				.data
ZERO:		.double 0
				.text
				.globl average
average:
				#####
				# $a0 <- double *arr
				# $a1 <- unsigned int n
				# $t0 <- double *last_element
				# $f0 <- double sum
				#####
				sll $t0, $a1, 3					# n << 3
				addu $t0, $a0, $t0			# last_element = arr + (n << 3)
				ldc1 $f0, ZERO					# sum = 0
while1:	bgeu $a0, $t0, done1		# while(arr < last_element)
				ldc1 $f4, 0($a0)				# *arr
				add.d $f0, $f0, $f4			# sum += *arr
				addiu $a0, $a0, 8				# arr++
				b while1
done1:	mtc1 $a1, $f4
				cvt.d.w $f4, $f4
				div.d $f0, $f0, $f4
				jr $ra