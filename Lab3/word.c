#include <stdio.h>
#include <stdint.h>

int a, b;
int result, result_asm_num, result_asm_denom;
extern void calculate_expression_asm();
extern void vvod();

int main() {
    vvod();
    return 0;
}
