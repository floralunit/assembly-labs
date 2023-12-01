#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

float a, b, numerator_c, denominator_c, result_c, numerator_asm, denominator_asm, result_asm;
int c;

extern  void  asmfunc();

int main (void)
{
	printf("(-3*a-b+53)/(c-a/2+1)");
	
	printf("\nEnter a (float) = ");
	scanf("%f", &a);
	printf("Enter b (float) = ");
	scanf("%f", &b);
	printf("Enter c (integer) = ");
	scanf("%d", &c);
	
	numerator_c = -1 * 3 * a - b + 53;
  	denominator_c = c - a/2 + 1;

  	result_c = numerator_c / denominator_c;
	
	printf("\nРезультат на Си: результат = %f, числитель = %f, знаменатель = %f", result_c, numerator_c, denominator_c);
	
	asmfunc();
	printf("\nРезультат на ассемблере: результат = %f, числитель = %f, знаменатель = %f", result_asm, numerator_asm, denominator_asm);
    	
    	printf("\n\n");
    	return 0;
}
