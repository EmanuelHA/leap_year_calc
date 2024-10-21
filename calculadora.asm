section .bss
    year resb 4         ; Reserva 4 bytes para almacenar el año
section .text
    global calculate_leap_year

calculate_leap_year:
    mov dword [year], edi; Limpia EAX (resultado)
    push rbx            ; Guarda EBX (conservar según ABI)
    mov eax, dword [year]; Almacena el año en EAX para hacer DIV
    mov edi, 4
    div edi             ; Divide el año entre 4
    cmp edx, 0
    jne no_leap_year    ; NO divisible entre 4 -> NO bisiesto
    
    mov eax, dword [year]; Almacena el año en EAX para hacer DIV
    mov edi, 100
    div edi             ; Divide el año entre 100
    cmp edx, 0
    jne leap_year       ; Divisible entre 4, pero no entre 100 -> bisiesto

    mov eax, dword [year]; Almacena el año en EAX para hacer DIV
    mov edi, 400
    div edi             ; Divide el año entre 400
    cmp edx, 0
    jne no_leap_year    ; Divisible entre 4 y entre 100, pero no entre 400 -> NO bisiesto

leap_year:
    mov eax, 1          ; EAX = 1 -> verdadero
    pop rbx             ; Restaura el valor de EBX (ABI)
    ret

no_leap_year:
    xor eax, eax        ; EAX = 0 -> verdadero
    pop rbx             ; Restaura el valor de EBX (ABI)
    ret
