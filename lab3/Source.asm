.686
.model flat, stdcall

.stack 100h

.data
	array dd 1.0, 1.0, 2.0, 1.0, -5.0, 5.0, 8.0, -2.0, 3.0, 9.0;
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	xor eAx,eAx 
	xor eDx,eDx
	xor eCx,eCx
	xor eBx,eBx; Очищаем усё

    call fpu_use
    jmp exit

    fpu_use proc

	loop_start:
    xor eAx,eAx
    mov ebx, ecx            ; Загружаем текущий индекс массива в eax


    cmp ebx, 10            ; Проверяем, достигли ли мы последнего элемента массива
    je end_loop             ; Если да, завершаем программу

    fld  [array + eCx * 4]   ; Загружаем число с плавающей запятой из массива в стек
    fmul [array + eBx * 4]  ; Умножаем на следующее число в массиве
    fld1                    ; Загружаем число 1 для сравнения
      fcompp    ; Сравниваем умноженное число с 1
      fstsw ax
      sahf
    je greater              ; Если равно 1, переходим к метке greater
    jb less                 ; Если неравно 1, переходим к метке less

    jmp next_iteration      ; Переходим к следующей итерации

greater:
    ; Обработка, если умноженное число равно 1
    add edx, 1;
    jmp next_iteration

less:
    ; Обработка, если умноженное не равно 1

    jmp next_iteration

next_iteration:
    inc ecx                 ; Увеличиваем счетчик элементов массива
    jmp loop_start          ; Переходим к следующей итерации

    end_loop:

    fpu_use endp

exit:
Invoke ExitProcess, edx;
End Start