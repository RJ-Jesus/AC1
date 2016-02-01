				.data
f1:			.float -20.0
f2:			.float 0.0
				.text
				.globl max
max:		#####
				# $a0 <- student *st
				# $a1 <- int ns
				# $a2 <- flaot *media
				# $t0 <- student *p
				# $t1 <- st + ns
				# $v0 <- student *pmax
				# $f16 <- float max_grade
				# $f18 <- float sum
				#####
				l.s $f16, f1						# max_grade = -20.0
				l.s $f18, f2						# sum = 0.0
				
				or $t0, $0, $a0					# p = st
				mul $t1, $a1, 44
				addu $t1, $a0, $t1			# st + ns
for:		bge $t0, $t1, done			# for(*; p < (st + ns); *)
				
				l.s $f0, 40($t0)
				add.s $f18, $f0, $f18		# sum += p->grade
				
				c.le.s $f0, $f16
				bc1t fi									# if(p->grade > max_grade)
				
				mov.s $f16, $f0					# max_grade = p->grade
				or $v0, $0, $t0					# pmax = p
				
fi:			addi $t0, $t0, 44				# p++
				b for

done:		mtc1 $a1, $f0
				cvt.s.w $f0, $f0
				div.s $f0, $f18, $f0
				s.s $f0, 0($a2)					# *media = sum / (float) ns
				jr $ra