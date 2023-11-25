#include <stdio.h>
#include <stdint.h>

unsigned int a, b;
int result, result_asm_num, result_asm_denom;
extern void calculate_expression_asm();

int calculate_expression(unsigned int a, unsigned int b) {
    if (a < b) {
        return b * a - 20;
    } else if (a == b) {
        return 20;
    } else {
    	if (b == 0){
    	printf("Error! b cannot be 0");
    	return 0;
    	}
    	else
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
 
unsigned int check_uint(unsigned int num) {
 if (num >= 0 && num<=65535){
	printf("\nValue %u is correct", num);
	return 1;
 }
 else{
	printf("\nValue %u has error!\n", num);
	return 0;
 }
}

int main() {
    printf("b*a-20, если a<b\n20, если a=b\n9*a/b, если a>b\n");
    printf("Enter values for a and b from 0 to 65535: ");
    scanf("%u %u", &a, &b);
    
    if (check_uint(a) == 1 && check_uint(b) == 1){
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
