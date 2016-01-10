#include "sqrt.c"

double stdev(double *array, int nval) {
    return sqrt(var(array, nval));
}
