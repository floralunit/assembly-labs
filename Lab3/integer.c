#include <stdio.h>
#include <stdint.h>

int a, b, result, result_asm_num, result_asm_denom;
extern void calculate_expression_asm();

int calculate_expression(int a, int b) {
    if (a < b) {
        return b * a - 20;
    } else if (a == b) {
        return 20;
    } else {
        return 9 * a / b;
    }
}

int check_int(int num) {
 if (num >= -32768 && num<=32767){
	printf("\nValue %d is correct", num);
	return 1;
 }
 else{
	printf("\nValue %d has error!\n", num);
	return 0;
 }
}

int main() {
    printf("b*a-20, если a<b\n20, если a=b\n9*a/b, если a>b\n");
    printf("Enter values for a and b from -32768 to 32767: ");
    scanf("%d %d", &a, &b);
    
    if (check_int(a) == 1 && check_int(b) == 1){
	    result = calculate_expression(a, b);
	    printf("\n\nC Result: X=%d\n", result);
	    check_int(result);
	    calculate_expression_asm();
	    printf("\n\nAssembly Result: X=%d\n", result_asm_num);
	    check_int(result_asm_num);
    }
    printf("\n");
    return 0;
}
