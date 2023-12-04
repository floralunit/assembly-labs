section .data
one dd 1.0
two dd 2.0
three dd -3.0
fivethree dd 53.0
extern a
extern b
extern c
extern numerator_asm
extern denominator_asm
extern result_asm    

section .text
    global asmfunc

asmfunc:
    ; вычисление числителя (-3*a-b+53)
    fld dword [a]          ; загрузка переменной a в стек сопроцессора
    fmul dword [three]       ; умножение на -3
    fld dword [b]          ; загрузка переменной b в стек сопроцессора
    fsub                    ; вычитание b из -3*a
    fld dword [fivethree]        ; загрузка числа 53 в стек сопроцессора
    fadd                    ; сложение с -3*a-b
    fstp dword [numerator_asm]  ; сохранение результата в переменную numerator

    ; вычисление знаменателя (c-a/2+1)         ; загрузка переменной c в стек сопроцессора
    fld dword [a]          ; загрузка переменной a в стек сопроцессора
    fdiv dword [two]         ; деление a на 2
    fisubr dword [c]                 ; вычитание a/2 из c
    fld dword [one]           ; загрузка числа 1 в стек сопроцессора
    fadd                    ; сложение с c-a/2
    fstp dword [denominator_asm] ; сохранение результата в переменную denominator

    ; вычисление результата числитель/знаменатель
    fld dword [numerator_asm]     ; загрузка числителя в стек сопроцессора
    fld dword [denominator_asm]   ; загрузка знаменателя в стек сопроцессора
    fdiv                        ; деление числителя на знаменатель
    fstp dword [result_asm]         ; сохранение результата в переменную result
    ret 
