int main(void) {
    char *src = "String to be copied";
    static char dst[19+1];
    print_str(strcpy(dst, src));
    return 0;
}
