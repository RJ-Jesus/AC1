#include <stdio.h>
#include "average.c"
#include "max.c"
#include "sort.c"
#include "f2c.c"
#include "var.c"
#include "stdev.c"

#define n 11

int main(void) {
    static double arr[n];
    printf("Fahrenheit: \n");
    for(int i = 0; i < n; i++) {
        int fah;
        scanf("%d", &fah);
        arr[i] = f2c((double) fah);
    }          
    printf("Celsius: \n");
    for(int i = 0; i < n; i++)
        printf("%lf\n", arr[i]);
    printf("Maximum: %lf\n", max(arr, n));
    printf("Median: %lf\n", sort(arr, n));
    printf("Average: %lf\n", average(arr, n));
    printf("Variance: %lf\n", var(arr, n));
    printf("Standard Deviation: %lf\n", stdev(arr, n));

    /*
    static double arr[n];
    int i;
    print_str("Fahrenheit: \n");
    for(i = 0; i < n; i++) {
        arr[i] = f2c((double) read_int());
    }
    print_str("Celsius: \n");
    for(i = 0; i < n; i++) {
        print_double(arr[i]);
        print_char('\n');
    }
    print_str("Maximum: ");
    print_double(max(arr, n));
    print_char('\n');
    print_str("Median: ");
    print_double(sort(arr, n));
    print_char('\n');
    print_str("Average: ");
    print_double(average(arr, n));
    print_char('\n');
    print_str("Variance: ");
    print_double(var(arr, n));
    print_char('\n');
    print_str("Standard Deviation: ");
    print_double(stdev(arr, n));
    print_char('\n');
    */
    return 0;
}
