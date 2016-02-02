				.text 
				.globl main
main:		ori $t0, $0, 1			# Set value of $t0 (to apply bitwise NOT to)
				xori $t0, $t0, -1		# ~$t0 = $t0 XOR 0xFFFFFFFF
				jr $ra
