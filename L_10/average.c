double average(double *arr, unsigned int n) {
    double *last_element = arr + n;
    double sum = 0;
    while(arr < last_element)
        sum += *arr++;
    return sum / n;
}
