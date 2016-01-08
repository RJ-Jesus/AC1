				.eqv TRUE 1
				.eqv FALSE 0
				.text
				.globl sort
sort:		#####
				# $a0 <- double *arr
				# $a1 <- unsigned int nval
				# $t0 <- int houveTroca
				# $t1 <- int i
				# $f4 <- double aux
				#####
do1:		li $t0, FALSE						# houveTroca = FALSE
				li $t1, 0								# i = 0
				subi $t2, $a1, 1				# nval-1
for2:		bge $t1, $t2, done2			# for(*; i < nval-1; *)
				sll $t3, $t1, 3					# i << 3
				addu $t3, $a0, $t3			# &arr[i]
				ldc1 $f4, 0($t3)				# aux = arr[i]
				ldc1 $f6, 8($t3)				# arr[i+1]
				c.le.d $f4, $f6					# if(arr[i] > arr[i+1])
				bc1t fi1
				sdc1 $f6, 0($t3)				# arr[i] = arr[i+1]
				sdc1 $f4, 8($t3)				# arr[i+1] = aux
				li $t0, TRUE
fi1:		addiu $t1, $t1, 1				# i++
				b for2
done2:	bne $t0, TRUE, done1		# while(houveTroca == TRUE)
				b do1
done1:	srl $v0, $a1, 1					# nval / 2
				sll $v0, $v0, 3					# (nval / 2) << 3
				addu $v0, $v0, $a0			# &arr[nval / 2]
				ldc1 $f0, 0($v0)
				jr $ra