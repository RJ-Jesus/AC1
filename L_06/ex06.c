#include<stdio.h>

#define SIZE 3

void main(void) {
  static char *array[SIZE] = {"Array", "de", "ponteiros"};
  char **p = array;
  char **last = array + SIZE;
  for(; p < last; p++) {
    printf("String #%s: ", *p);
    char *pchar = *p;
    while(*pchar != '\0')
      printf("%c-", *pchar++);
    printf("\n");
  }
}
