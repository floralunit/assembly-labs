#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint8_t var = 0;
int16_t result = 0;

extern  int  asmfunc(void);

int main (void)
{
	printf("Enter x = ");
	int rc = scanf("%hhd", &var);
	result = asmfunc();
	printf("res = %u, var = %d\n", result, var);
	return 0;
}
