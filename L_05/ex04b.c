#define SIZE 10

void fillArray(int *p, int n) {
    int *plast;
    for(plast = p+n; p < plast; p++)
        *p = read_int();
}

void printArray(int *arr, int n) {
    int i;
    for(i = 0; i < n; i++) {
        print_int10(arr[i]);
        print_char(',');
    }
    print_char('\n');
}

void main(void) {
    static int lista[SIZE];
    int houveTroca, aux, i;
    int *p, *pUltimo; 

    fillArray(lista, SIZE);
    
    pUltimo = lista + SIZE;
    i = 1;
    do {
        houveTroca = FALSE;
        for(p = lista; p < pUltimo - i; p++) {
            if(*p > *(p+1)) {
                aux = *p;
                *p = *(p+1);
                *(p+1) = aux;
                houveTroca = TRUE;
            }
        }
        i++;
    } while(houveTroca == TRUE);

    printArray(lista, SIZE);
}
