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
	xor eBx,eBx; ������� ��

	mov ax,Z
	xor ax,i; ��������� � ��������
	

	mov bx,X
	xor bx,i; ��������� � ��������


	mov cx,Y
	xor cx,i; ��������� � ��������
	

	and bx,cx ; �������� � ���������


	sub ax, 4000 ; ����������� ����� ��� ���������� ����� �������

	mul H ; �������� ��� ��������


	add ax,bx ; ��������� ������������
	mov M,ax 


	cmp dx,0 ; �������� �� ���������� �������
		ja KTSB
xor eDx,eDx ; ������� ��������
		sub ax, 991Eh
		mov R,ax

	 jmp part3	; ���� �� ������ �������������� ��������� �� 3 �����

	KTSB: 
		mov dx,ax; ���� �� �� ��������� ����
	 shl ax,8
	 shr dx,8
	 add ax,dx
	 mov R,ax



	 part3: ; ����� 3

	 cmp R,0991h
	 jbe Aehhb ; ���� ����� ������ �� ������ 

	 mov R,ax ; �����
	xor ax,0080h
	mov ax,R
	 
	jmp hell ; ������� � �����

	 Aehhb: ; � ����

	 or ax,2381h

	 hell: ; ���� ��

	 mov R,aX

	exit:
		Invoke ExitProcess, ax
	End Start