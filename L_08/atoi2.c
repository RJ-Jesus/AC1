unsigned int atoi2(char *s) {
    unsigned int digit, res = 0;
    while(*s >= '0' && *s <= '1') {
        digit = *s++ - '0';
        res = 2 * res + digit;
    }
    return res;
}
