.686
.model flat, stdcall
.stack 100h
.data
X dw -20 ;���������� ����������
Y dw 54 
M dw 0
Z dw -5
I dw 1; �� ������� �������� :)
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov		ax,0 ; ��� �������� �������� ������������ � ����
mov		bx,0 
mov		cx,0 
mov		dx,0 

    mov ax,Y; ���������� �������� Y � �������
    xor ax,1111b; ����������� �������(���������) 4 ����

    mov bx,Z; ��������� ��������� ������� � �������������� ������ � Z
    xor bx,1111b;

    and ax,X; ������ �������� � ���������
    xor ax,bx; ������ �������� � ���������
    sar ax,1;������� �� ����� ����� ������ ��� ������ �������� ����

    mov M,ax; ������� ����� �� ��������
  
Invoke ExitProcess, M
End Start
