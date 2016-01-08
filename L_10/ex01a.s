				.data
f1:			.float 2.59375
				.text
				.globl ex01a
ex01a:	#####
				# $f4 <- float res
				# $t0 <- int val
				#####
do1:		li $v0, 5
				syscall								# read_int()
				or $t0, $0, $v0				# val = read_int()
				mtc1 $t0, $f4
				cvt.s.w $f4, $f4			# (float) val
				l.s $f5, f1
				mul.s $f4, $f4, $f5		# res = (float) val * f1
				mov.s $f12, $f4
				li $v0, 2
				syscall								# print_float(res)
				mtc1 $0, $f5
				c.eq.s $f4, $f5				# while(res != 0.0)
				bc1t done1
				b do1
done1:	li $v0, 0
				jr $ra