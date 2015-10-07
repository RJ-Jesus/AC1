			.data
str1:
			.asciiz "Introduza 2 números:\n"
str2:
			.asciiz "A soma dos dois números é: "

			.text
			.globl main
main:
			# Load and print str1
			la $a0, str1
			ori $v0, $0, 4
			syscall
			
			# Read a
			ori $v0, $0, 5
			syscall
			or $t0, $0, $v0
			
			# Read b (+ sum)
			ori $v0, $0, 5
			syscall
			add $t0, $t0, $v0
			
			# Load and print str2
			la $a0, str2
			ori $v0, $0, 4
			syscall
			
			# Load and print result
			or $a0, $0, $t1
			ori $v0, $0, 1
			syscall
			
			jr $ra
