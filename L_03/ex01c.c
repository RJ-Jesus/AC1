#include <stdio.h>

void main(void) {
  int value, bit, i;
  printf("Introduza um número: ");
  scanf("adsd", &value);
  printf("O valor em binário: ");
  for(i = 0; i < 32; i++) {
    bit = value & 0x80000000;
    printf("%d\n", bit);
    value = value << 1;
  }
}
