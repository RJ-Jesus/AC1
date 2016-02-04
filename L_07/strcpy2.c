char *strcpy(char *dst, char *src) {
    char *p = dst;
    do {
        *dst++ = *src;
    } while(*src++ != '\0');
    return p;
}
