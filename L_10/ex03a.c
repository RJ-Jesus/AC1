#include <stdio.h>
#include "average.c"

#define n 11

int main(void) {
    static double arr[n];
    for(int i = 0; i < n; i++)
        scanf("%lf", &arr[i]);
    printf("Average: %lf\n", average(arr, n));
    /*
    static double arr[n];
    int i;
    for(i = 0; i < n; i++)
        arr[i] = read_double();
    print_str("Average: ");
    print_double(average(arr, n));
    print_char('\n');
    */
    return 0;
}
