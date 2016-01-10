
int abs(int val) {
    if(val < 0)
        val = -val;
    return val;
}

double xtoy(double x, int y) {
    int i;
    double result;
    for(i = 0, result = 1.0; i < abs(y); i++) {
        if(y > 0)
            result *= x;
        else
            result /= x;
    }
    return result;
}
