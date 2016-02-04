#include<stdio.h>

#define SIZE 3

void main(void) {
    static char *array[SIZE] = {"Array", "de", "ponteiros"};
    char **p, **plast;
    char *pchar;
    int i;
    p = array;
    plast = array + SIZE;
    for(i = 0; p < plast; p++, i++) {
        printf("String #%d: ", i);
        pchar = *p;
        while(*pchar != '\0')
            printf("%c-", *pchar++);
        printf("\n");
    }
}
