#include<stdio.h>

int main(int argc, char *argv[]) {
  printf("No of parameters: %d\n", argc-1);
  char *b = "";
  int size = 0;
  for(int i = 1; i < argc; i++) {
    printf("%d - %s\n", i, argv[i]);
    int letters = 0;
    int characters = 0;
    int j = 0;
    while(argv[i][j] != '\0') {
      if((argv[i][j] >= 'A' && argv[i][j] <= 'Z') || (argv[i][j] >= 'a' && argv[i][j] <= 'z'))
	letters++;
      characters++;
      j++;
    }
    if(characters > size) {
      b = argv[i];
      size = characters;
    }
    printf("  Letters: %d\n", letters);
    printf("  Characters: %d\n", characters);
  }
  if(size)
    printf("Biggest word: %s\n", b);
  return 0;
}
