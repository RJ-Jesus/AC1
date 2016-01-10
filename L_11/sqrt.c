double sqrt(double val) {
    double aux, xn = 1.0;
    int i = 0;
    if(val <= 0.0)
        return 0.0;
    do {
        aux = xn;
        xn = 0.5 * (xn + val/xn);
    } while((aux != xn) && (++i < 25));
    return xn;
}
