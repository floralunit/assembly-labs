#include <stdio.h>

// Функция для ввода элементов массива А
void inputArray(int A[], int N) {
    printf("Введите элементы массива:\n");
    for (int i = 0; i < N; i++) {
        printf("A[%d]: ", i);
        scanf("%d", &A[i]);
    }
}

// Функция для вывода элементов массива А
void outputArray(int A[], int N) {
    printf("Элементы массива:\n");
    for (int i = 0; i < N; i++) {
        printf("%d ", A[i]);
    }
    printf("\n");
}

// Функция для вызова модуля обработки на языке Ассемблера
extern void asmArrayFunc();
int N, L, c, d, result_asm;
int arr[];

int main() {
    printf("Введите длину массива N: ");
    scanf("%d", &N);

    inputArray(arr, N);
    
    printf("Введите количество первых отрицательных элементов L: ");
    scanf("%d", &L);
    printf("Введите значение c: ");
    scanf("%d", &c);
    printf("Введите значение d: ");
    scanf("%d", &d);
    
    outputArray(arr, N);
    
    int result_c = 1;
    int count = 0;

    for (int i = 0; i < N; i++) {
        if (arr[i] >= c && arr[i] <= d) {
            if (arr[i] < 0) {
                result_c *= arr[i];
                count++;
            }
            if (count == L) {
                break;
            }
        }
    }

    printf("Результат на СИ: произведение первых %d отрицательных элементов в промежутке [%d, %d] равно: %d\n", L, c, d, result_c);
    asmArrayFunc();
    printf("Результат на ассемблер: произведение первых %d отрицательных элементов в промежутке [%d, %d] равно: %d\n", L, c, d, result_asm);

    return 0;
}
