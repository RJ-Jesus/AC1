#define TRUE 1
#define FALSE 0

double sort(double *arr, unsigned int nval) {
    int houveTroca, i, aux;
    do {
        houveTroca = FALSE;
        for(i = 0; i < nval-1; i++) {
            if(arr[i] > arr[i+1]) {
                aux = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = aux;
                houveTroca = TRUE;
            }
        }
    } while(houveTroca == TRUE);
    return arr[nval / 2];
}
