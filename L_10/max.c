#include <float.h>

double max(double *arr, unsigned int n) {
    double *last = arr + n;
    double max = DBL_MIN;
    while(arr < last) {
        if(max < *arr)
            max = *arr;
        arr++;
    }
    return max;
}
