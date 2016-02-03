int array[4] = {7692, 23, 5, 234};

int main(void) {
    int i, soma=0;
    for(i = 0; i < 4; i++)
        soma += array[i];
    print_int10(soma);
    return 0;
}
