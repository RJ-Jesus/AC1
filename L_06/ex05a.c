#include<stdio.h>

int main(int argc, char *argv[]) {
    int maxSize, letters, i, j;
    char *maxString;
    printf("No of parameters: %d\n", argc-1);
    maxSize = 0;
    for(i = 1; i < argc; i++) {
        printf("%d - %s\n", i, argv[i]);
        letters = 0;
        j = 0;
        while(argv[i][j] != '\0') {
            if((argv[i][j] >= 'A' && argv[i][j] <= 'Z') || (argv[i][j] >= 'a' && argv[i][j] <= 'z'))
                letters++;
            j++;
        }
        if(j > maxSize) {
            maxString = argv[i];
            maxSize = j;
        }
        printf("  Letters: %d\n", letters);
        printf("  Characters: %d\n", j);
    }
    if(maxSize)
        printf("Biggest word: %s\n", maxString);
    return 0;
}
