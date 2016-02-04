int main(int argc, char *argv[]) {
    int val1, val2, res, exit_code;
    char op;

    exit_code = 0;
    if(argc == 3) {
        val1 = atoi(argv[0]);
        val2 = atoi(argv[2]);
        op = argv[1][0];
        if(op == 'x')
            res = val1 * val2;
        else if(op == '/')
            res = div(val1, val2) & 0x0000FFFF;
        else if(op == '%')
            res = div(val1, val2) >> 16;
        else {
            print_str("\nOperação desconhecida");
            exit_code = 1;
        }
    }
    else {
        print_str("\nNúmero de argumentos errado");
        exit_code = 2;
    }
    if(exit_code == 0) {
        print_int_ac1(val1, 10);
        print_char(op);
        print_int_ac1(val2, 10);
        print_char('=');
        print_int_ac1(res, 10);
    }
    return exit_code;
}
