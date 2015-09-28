			.text
			.globl	main
main: ori $t0, $0, 0xAD12345E  # Set $t0 (value to shift)

			or $t4, $0, $t0
			ori $t5, $0, 0xF0000000
			ori $t6, $0, 28
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x0F000000
			ori $t6, $0, 24
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x00F00000
			ori $t6, $0, 20
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x000F0000
			ori $t6, $0, 16
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x0000F000
			ori $t6, $0, 12
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x00000F00
			ori $t6, $0, 8
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x000000F0
			ori $t6, $0, 4
			jal AND_SRA
			jal PRINT_HEX
			
			or $t4, $0, $t0
			ori $t5, $0, 0x0000000F
			ori $t6, $0, 0
			jal AND_SRA
			jal PRINT_HEX

#####
# @Params; $t4, $t5, $t6
# @Return: $t7
# $t6 <- $t4 & $t5 ->
# 		$t7 <- $t7 >> $t6 ->
# 		RETURN
#####
AND_SRA:
			and $t7, $t4, $t5
			srlv $t7, $t7, $t6
			jr $ra

#####
# @Params: $t7
# @Return: NaN
# PRINT HEX $t7 ->
# 	RETURN
#####
PRINT_HEX:
			ori $v0, $0, 34
			or $a0, $0, $t7
			syscall
			ori $v0, $0, 11
			ori $a0, $0, 10
			syscall
			jr $ra
