typedef struct {
    unsigned int id_number;
    char first_name[18];
    char last_name[15];
    float grade;
} student;

int main(void) {
    static student stg;
    print_str("N. Mec: ");
    stg.id_number = read_int();
    print_str("Primeiro nome: ");
    read_str(stg.first_name, 18);
    print_str("Último nome: ");
    read_str(stg.last_name, 15);
    print_str("Nota: ");
    stg.grade = read_float();

    print_str("\nN. Mec: ");
    print_intu10(stg.id_number);
    print_str("\nNome: ");
    print_str(stg.last_name);
    print_char(',');
    print_str(stg.first_name);
    print_str("\nNota: ");
    print_float(stg.grade);
    return 0;
}
