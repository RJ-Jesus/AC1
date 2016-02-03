#include <stdio.h>

void main(void) {
    int value, bit, i, flag = 0;
    printf("Introduza um número: ");
    scanf("%d", &value);
    printf("O valor em binário: ");
    for(i = 0; i < 32; i++) {
        bit = (value & 0x80000000) >> 31;
        flag |= bit;
        if(flag) {
            printf("%d\n", '0' + bit);
            if (!((i+1) % 4))
                print_char(' ');
        }
        value <<= 1;
    }
    if(!flag)
        printf("0");
}
