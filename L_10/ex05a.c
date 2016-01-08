#include <stdio.h>
#include "average.c"
#include "max.c"
#include "sort.c"

#define n 11

int main(void) {
    static double arr[n];
    for(int i = 0; i < n; i++)
        scanf("%lf", &arr[i]);
    printf("Average: %lf\n", average(arr, n));
    printf("Maximum: %lf\n", max(arr, n));
    printf("Median: %lf\n", sort(arr, n));
    for(int i = 0; i < n; i++)
        printf("%lf\n", arr[i]);
    /*
    static double arr[n];
    int i;
    for(i = 0; i < n; i++)
        arr[i] = read_double();
    print_str("Average: ");
    print_double(average(arr, n));
    print_char('\n')
    print_str("Maximum: ");
    print_double(max(arr, n));
    print_char('\n');
    print_str("Median: ");
    print_double(sort(arr, n));
    print_char('\n');
    for(i = 0; i < n; i++) {
        print_double(arr[i]);
        print_char('\n');
    }
    */
    return 0;
}
