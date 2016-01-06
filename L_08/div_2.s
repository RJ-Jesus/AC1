				.text
				.globl div_2
div_2:		#####
				# $a0 <- unsigned int dividendo
				# $a1 <- unsigned int divisor
				# $t0 <- int i
				# $t1 <- int bit
				# $t2 <- int quociente
				# $t3 <- int resto
				# $t4 <- int flag_bit
				#####
				sll $a1, $a1, 16						# divisor = divisor << 16
				andi $a0, $a0, 0xFFFF				# dividendo & 0xFFFF
				sll $a0, $a0, 1							# dividendo = (dividendo & 0xFFFF) << 1
				
				li $t0, 0										# i = 0
for1:		bge $t0, 16, done1					# for(*; i < 16; *)
				li $t1, 0										# bit = 0
				bltu $a0, $a1, ei1_2				# if(dividendo >= divisor)
				subu $a0, $a0, $a1					# dividendo = dividendo - divisor
				li $t1, 1										# bit = 1
				b fi1
ei1_2:	bne $t0, 15, fi1						# else if(i == 15)
				andi $t4, $a0, 0x80000000		# flag_bit = dividendo & 0x8000000
fi1:		sll $a0, $a0, 1							# dividendo << 1
				or $a0, $a0, $t1						# dividendo = (dividendo << 1) | bit
				addiu $t0, $t0, 1						# i++
				b for1
done1:	srl $t3, $a0, 1							# dividendo >> 1
				or $t3, $t3, $t4						# ((dividendo >> 1) | flag_bit)
				andi $t3, $t3, 0xFFFF0000		# resto = ((dividendo >> 1) | flag_bit) & 0xFFFF0000
				andi $t2, $a0, 0xFFFF				# quociente = dividendo & 0xFFFF
				or $v0, $t3, $t2
				jr $ra
