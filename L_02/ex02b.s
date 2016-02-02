        .eqv SHAMT 4
        .text
        .globl main
main:   ori $t0, $0, 0x862A5C1B   # Set $t0 (value to shift)
        # Shift Operations
        sll $t2, $t0, SHAMT       # SLL
        srl $t3, $t0, SHAMT       # SRL
        sra $t4, $t0, SHAMT       # SRA
        jr $ra
