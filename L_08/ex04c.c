unsigned int div(unsigned int dividendo, unsigned int divisor) {
    int i, bit, quociente, resto, flag_bit;

    divisor = divisor << 16;
    dividendo = (dividendo & 0xFFFF) << 1;

    for(i = 0; i < 16; i++) {
        bit = 0;
        if(dividendo >= divisor) {
            dividendo = dividendo - divisor;
            bit = 1;
        }
        else if(i == 15)   // caso contrário perde-se o bit
            flag_bit = dividendo & 0x80000000;
        dividendo = (dividendo << 1) | bit;
    }
    resto = ((dividendo >> 1) | flag_bit) & 0xFFFF0000;
    quociente = dividendo & 0xFFFF;

    return (resto | quociente);
}
