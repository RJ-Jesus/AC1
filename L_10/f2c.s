				.data
f1:			.double 32
f2:			.double 5
f3:			.double 9
				.text
				.globl f2c
f2c:		#####
				# $f12 <- double ft
				#####
				l.d $f4, f1
				l.d $f6, f2
				l.d $f8, f3
				sub.d $f0, $f12, $f4		# ft - 32
				mul.d $f0, $f0, $f6			# (ft - 32) * 5
				div.d $f0, $f0, $f8			# (ft - 32) * 5 / 9
				jr $ra