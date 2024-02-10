.686
.model flat, stdcall
.stack 100h
.data
X dw -20 ;Объявление переменных
Y dw 54 
M dw 0
Z dw -5
I dw 1; По приколу единичка :)
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov		ax,0 ; тут значения регистра сбрасываются к нулю
mov		bx,0 
mov		cx,0 
mov		dx,0 

    mov ax,Y; Перемещаем значение Y в регистр
    xor ax,1111b; Инвертируем младшие(последние) 4 бита

    mov bx,Z; Повторяем процедуру вставки и инвертирования только с Z
    xor bx,1111b;

    and ax,X; Первое действие в скобочках
    xor ax,bx; Второе действие в скобочках
    sar ax,1;Деление но через сдвиг вправо без сдвига старшего бита

    mov M,ax; Вставка итога из регистра
  
Invoke ExitProcess, M
End Start
