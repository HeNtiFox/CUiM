.586
.XMM
.MODEL flat, C

.DATA

k dd 0
res dd ?

.CODE

extern cfunc:near

public getak
getak proc C x:dword, n:dword
    
    finit
    ;dec k

loopy:

    inc k
    push k
    push x
    call cfunc
    fabs
    fld res
    fadd
    fstp res
    mov ecx, n
    cmp k, ecx
    jb loopy

    fld res
    ret            

getak endp       
End            
