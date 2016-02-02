        .text 
        .globl main 
main:   ori $t0, $0, 1      # Set value for $t0
        ori $t1, $0, 1      # Set value for $t1
        # Bitwise Operations
        and $t2, $t0, $t1   # AND
        or  $t3, $t0, $t1   # OR
        nor $t4, $t0, $t1   # NOR
        xor $t5, $t0, $t1   # XOR
        jr $ra
