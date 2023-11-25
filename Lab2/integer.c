#include <stdio.h>
#include <stdint.h>

extern int result_asm_num;
extern int result_asm_denom;

int calculate_expression(int a, int b, int c) {
    if (a < b) {
        return b * a - 20;
    } else if (a == b) {
        return 20;
    } else {
        return 9 * a / b;
    }
}

int main() {
    int a, b, c, result;

    printf("Enter values for a, b, and c: ");
    scanf("%d %d %d", &a, &b, &c);

    result = calculate_expression(a, b, c);
    printf("Result: %d\n", result);
    
    return 0;
}