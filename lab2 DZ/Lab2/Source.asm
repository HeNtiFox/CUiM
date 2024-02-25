	.686
	.model flat, stdcall

	.stack 100h

	.data
	X dw 45B2h
	Y dw 1C2Dh
	Z dw 203Eh
	I dw 00FFh
	H dw 8
	R dw ?
	M dw ?

	.code
	ExitProcess PROTO STDCALL :DWORD
	Start:
	xor eAx,eAx 
	xor eDx,eDx
	xor eCx,eCx
	xor eBx,eBx; Очищаем усё

	mov ax,Z
	xor ax,i; Вставляем и инвертим
	

	mov bx,X
	xor bx,i; Вставляем и инвертим


	mov cx,Y
	xor cx,i; Вставляем и инвертим
	

	and bx,cx ; Действие в скобочках


	sub ax, 4000 ; Модификация числа для неозможной ветки событий

	mul H ; Действие вне скобочек


	add ax,bx ; Финальное суммирование
	mov M,ax 


	cmp dx,0 ; Проверка на выполнение условия
		ja KTSB
xor eDx,eDx ; Очистка регистра
		sub ax, 991Eh
		mov R,ax

	 jmp part3	; Чтоб не задела действительную переходит на 3 часть

	KTSB: 
		mov dx,ax; Если да то переходит сюда
	 shl ax,8
	 shr dx,8
	 add ax,dx
	 mov R,ax



	 part3: ; Часть 3

	 cmp R,0991h
	 jbe Aehhb ; Если число меньше то уходит 

	 mov R,ax ; Иначе
	xor ax,0080h
	mov ax,R
	 
	jmp hell ; Переход в конец

	 Aehhb: ; А сюда

	 or ax,2381h

	 hell: ; хехе Ад

	 mov R,aX

	exit:
		Invoke ExitProcess, ax
	End Start