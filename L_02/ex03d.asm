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
			
			# Read b
			ori $v0, $0, 5
			syscall
			or $t1, $0, $v0
			
			# Add both numbers
			add $t2, $t0, $t1
			
			# Load and print str2
			la $a0, str2
			ori $v0, $0, 4
			syscall
			
			# Load and print result
			or $a0, $0, $t2
			ori $v0, $0, 1
			syscall
			
			jr $ra
