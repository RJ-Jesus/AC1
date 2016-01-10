#include "xtoy.c"

double var(double *array, int nval) {
    int i;
    double media, soma, res;
    media = average(array, nval);
    for(i = 0, soma = 0.0; i < nval; i++)
        soma += xtoy(array[i]-media, 2);
    res = soma / nval;
    return res;
}
