section .data
three dd -3.
fivethree dd 53.
extern a
extern b
extern c
extern numerator_asm
extern denominator_asm
extern result_asm
extern remainder_asm

; y = (-3*a-b+53)/(c-a/2+1)

section .text
global asmfunc

asmfunc:
    finit
    fild dword [three]        ; загрузка переменной a в стек сопроцессора
    fmul ST0, ST0
    ;fild -3.0
    ;fmul ST0, ST1        ; умножение на -3
    ;fld dword [b]          ; загрузка переменной b в стек сопроцессора
    ;fsub ST0, ST1                   ; вычитание b из -3*a
    ;fld 53.0          ; загрузка числа 53 в стек сопроцессора
    ;fadd ST0, ST2                    ; сложение с -3*a-b
    fstp dword [numerator_asm]  ; сохранение результата в переменную numerator

    ret
