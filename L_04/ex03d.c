void main(void) {
    static char str[20];
    char *p;
    print_str("Introduza uma string: ");
    read_str(str, 20);
    p = str;
    while(*p != '\0') {
        if(*p >= 'a' && *p <= 'z')
            *p = *p - 'a' + 'A';
        else if(*p >= 'A' && *p <= 'Z')
            *p = *p - 'A' + 'a';
        p++;
    }
    print_str(str);
}
