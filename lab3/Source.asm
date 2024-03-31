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
	xor eBx,eBx; ������� ��

    call fpu_use
    jmp exit

    fpu_use proc

	loop_start:
    xor eAx,eAx
    mov ebx, ecx            ; ��������� ������� ������ ������� � eax


    cmp ebx, 10            ; ���������, �������� �� �� ���������� �������� �������
    je end_loop             ; ���� ��, ��������� ���������

    fld  [array + eCx * 4]   ; ��������� ����� � ��������� ������� �� ������� � ����
    fmul [array + eBx * 4]  ; �������� �� ��������� ����� � �������
    fld1                    ; ��������� ����� 1 ��� ���������
      fcompp    ; ���������� ���������� ����� � 1
      fstsw ax
      sahf
    je greater              ; ���� ����� 1, ��������� � ����� greater
    jb less                 ; ���� ������� 1, ��������� � ����� less

    jmp next_iteration      ; ��������� � ��������� ��������

greater:
    ; ���������, ���� ���������� ����� ����� 1
    add edx, 1;
    jmp next_iteration

less:
    ; ���������, ���� ���������� �� ����� 1

    jmp next_iteration

next_iteration:
    inc ecx                 ; ����������� ������� ��������� �������
    jmp loop_start          ; ��������� � ��������� ��������

    end_loop:

    fpu_use endp

exit:
Invoke ExitProcess, edx;
End Start