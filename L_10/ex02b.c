#include <stdio.h>
#include "f2c.c"

int main(void) {
    double ft;
    printf("Fahrenheit: ");
    scanf("%lf", &ft);
    printf("Celsius: %lf\n", f2c(ft));
    /*
    double ft;
    print_str("Fahrenheit: ");
    ft = read_double();
    print_str("Celsius: ");
    print_double(f2c(ft));
    print_char('\n');
    */
    return 0;
}
