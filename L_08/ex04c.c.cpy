unsigned int div(unsigned int dividendo, unsigned int divisor) {
    int i, bit, quociente, resto, s_bit;

    divisor = divisor << 16;
    dividendo = (dividendo & 0xFFFF) << 1;

    for(i = 0; i < 16; i++) {
        bit = 0;
        if(dividendo >= divisor) {
            dividendo = dividendo - divisor;
            bit = 1;
        }
        if(i < 15 || bit)   # caso contrário perde-se o bit
            s_bit = dividendo & 0x8000;
        dividendo = (dividendo << 1) | bit;
    }
    resto = ((dividendo >> 1) | s_bit) & 0xFFFF0000;
    quociente = dividendo & 0xFFFF;

    return (resto | quociente);
}
