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
    int houveTroca, i, aux;
    
    fillArray(lista, SIZE);

    do {
        houveTroca = FALSE;
        for(i = 0; i < SIZE-1; i++) {
            if(lista[i] > lista[i+1]) {
                aux = lista[i];
                lista[i] = lista[i+1];
                lista[i+1] = aux;
                houveTroca = TRUE;
            }
        }
    } while(houveTroca == TRUE);

    printArray(lista, SIZE);
}
