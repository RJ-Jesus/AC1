				.data
str1:		.asciiz "N. Mec: "
str2:		.asciiz "Primeiro Nome: "
str3:		.asciiz "Úlitmo Nome: "
str4:		.asciiz "Nota: "
				.text
				.globl read_data
read_data:
				#####
				# $s0 <- $a0 <- student *st
				# $s1 <- $a1 <- int ns
				# $s2 <- int i
				# $s3 <- &st[i]
				#####
				addiu $sp, $sp, -20
				sw $s0, 0($sp)
				sw $s1, 4($sp)
				sw $s2, 8($sp)
				sw $s3, 12($sp)
				sw $ra, 16($sp)
				or $s0, $0, $a0
				or $s1, $0, $a1
				
				li $s2, 0								# i = 0
for:		bge $s2, $s1, done			# for(*; i < n; *)
				
				la $a0, str1
				li $v0, 4
				syscall									# print_str(str1)
				
				li $v0, 5
				syscall
				mul $s3, $s2, 44
				addu $s3, $s0, $s3
				sw $v0, 0($s3)					# st[i].id_number = read_int()
				
				la $a0, str2
				li $v0, 4
				syscall									# print_str(str2)
				
				addiu $a0, $s3, 4
				li $a1, 18
				li $v0, 8
				syscall									# read_str(st[i].first_name, 18)
				
				la $a0, str3
				li $v0, 4
				syscall									# print_str(str3)
				
				addiu $a0, $s3, 22
				li $a1, 15
				li $v0, 8
				syscall									# read_str(st[i].last_name, 15)
				
				la $a0, str4
				li $v0, 4
				syscall									# print_str(str4)
				
				li $v0, 6
				syscall
				s.s $f0, 40($s3)				# st[i].grade = read_float()
				
				addi $s2, $s2, 1				# i++
				b for
done:		lw $s0, 0($sp)
				lw $s1, 4($sp)
				lw $s2, 8($sp)
				lw $s3, 12($sp)
				lw $ra, 16($sp)
				addiu $sp, $sp, 20
				jr $ra