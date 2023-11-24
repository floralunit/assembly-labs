#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

unsigned int a, b, c;
int numerator_c, denominator_c, result_c;
int numerator_asm, remainder_asm, denominator_asm, result_asm;

extern  void  asmfunc();

int main (void)
{
	printf("(-3*a-b+53)/(c-a/2+1)");
	
	printf("\nEnter a from 0 to 65535 = ");
	scanf("%u", &a);
	printf("Enter b from 0 to 65535 = ");
	scanf("%u", &b);
	printf("Enter c from 0 to 65535 = ");
	scanf("%u", &c);
	
	numerator_c = -1 * 3 * a - b + 53;
  	denominator_c = c - a/2 + 1;

  	result_c = numerator_c / denominator_c;
  	int remainder = numerator_c % denominator_c;
	
	printf("\nРезультат на Си: целое = %d, остаток = %d, числитель = %d, знаменатель = %d", result_c, remainder, numerator_c, denominator_c);
	
	asmfunc();
	printf("\nРезультат на ассемблере: целое = %d, остаток = %d, числитель = %d, знаменатель = %d", result_asm, remainder_asm, numerator_asm, denominator_asm);
    	
    	printf("\n\n");
    	return 0;
}
