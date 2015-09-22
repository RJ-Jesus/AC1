		.text 
		.globl   main 
main:	ori $v0, $0, 5
		syscall
		ori $t0, $0, 8
		add $t1, $v0, $v0
		sub $a0, $t1, $t0
		ori $v0, $0, 36
		syscall
		jr $ra
