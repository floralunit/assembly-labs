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
extern int asmArrayProduct(int A[], int N, int L, int c, int d);

int main() {
    int N, L, c, d;
    printf("Введите длину массива N: ");
    scanf("%d", &N);
    int A[N];

    inputArray(A, N);
    
    printf("Введите количество первых отрицательных элементов L: ");
    scanf("%d", &L);
    printf("Введите значение c: ");
    scanf("%d", &c);
    printf("Введите значение d: ");
    scanf("%d", &d);
    
    outputArray(A, N);
    
    int result = asmArrayProduct(A, N, L, c, d);
    printf("Произведение первых %d отрицательных элементов массива, удовлетворяющих условию %d <= a[i] <= %d, составляет: %d\n", L, c, d, result);

    return 0;
}
