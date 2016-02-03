#include <stdio.h>

void main(void) {
    int value, bit, i;
    printf("Introduza um número: ");
    scanf("%d", &value);
    printf("O valor em binário: ");
    for(i = 0; i < 32; i++) {
        bit = value & 0x80000000;
        printf("%d\n", '0' + (bit >> 31));
        if (!((i+1) % 4))
            print_char(' ');
        value <<= 1;
    }
}
