; MIT License - Copyright 2020
; David Reguera Garcia aka Dreg - dreg@fr33project.org
; -
; http://github.com/David-Reguera-Garcia-Dreg/ - http://www.fr33project.org/
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
; IN THE SOFTWARE.

%idefine TWORD_size 10
%idefine QWORD_size 8
%idefine DWORD_size 4
%idefine WORD_size 2
%idefine BYTE_size 1
%imacro VAR 2+
%{1}: %{2}
%{1}_size equ ($-%{1})
%endmacro
%idefine sizeof(_x_) _x_%+_size

section .text
    global _start

_start:
 times 100 db 90h

    call drgs
    var msg, db "Hello D R E G!",10,10,0
    drgs:

    pop rsi
    mov rax, 1
    mov rdi, 1
    mov rdx, sizeof(msg)
    syscall

 times 100 db 90h
