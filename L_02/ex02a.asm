			.text
			.globl	main
main: ori $t0, $0, 0x862A5C1B  # Set $t0 (value to shift)
			# Shifting Operations
			sll $t2, $t0, 4  # SSL
			srl $t3, $t0, 4  # SRL
			sra $t4, $t0, 4  # SRA
			jr $ra
