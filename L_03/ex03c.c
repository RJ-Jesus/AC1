void main(void) {
    int res = 0, i = 0, mdor, mdo;
    print_str("Introduza dois números: ");
    mdor = read_int();
    mdo = read_int();
    while((mdor != 0) && (i++ < 16)) {
        if((mdor & 0x00000001) != 0)
            res += mdo;
        mdo <<= 1;
        mdor >>= 1;
    }
}
