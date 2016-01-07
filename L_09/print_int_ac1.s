				.text
				.globl print_int_ac1
print_int_ac1:
				#####
				# $a0 <- unsigned int num
				# $a1 <- unsigned int base
				# $s0 <- num % base
				#####
				addiu $sp, $sp, -8
				sw $s0, 0($sp)
				sw $ra, 4($sp)
				
				divu $a0, $a1
				mfhi $s0
				mflo $a0
				
				beqz $a0, fi1					# if(num / base)
				jal print_int_ac1			# prinrt_int_ac1(num / base, base)
fi1:		or $a0, $0, $s0
				jal toascii						# toascii(num % base)
				
				or $a0, $0, $v0
				li $v0, 11
				syscall								# print_char(toascii(num % base))
				
				lw $s0, 0($sp)
				lw $ra, 4($sp)
				addiu $sp, $sp, 8
				jr $ra


toascii:
				#####
				# $a0 <- char v
				#####
				addiu $v0, $a0, '0'		# v += '0'
				ble $v0, '9', fi2			# if(v > '9')
				addiu $v0, $v0, 7			# v += 7
fi2:		jr $ra