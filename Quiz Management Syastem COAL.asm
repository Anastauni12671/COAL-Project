INCLUDE Irvine32.inc

.DATA
bigEndian BYTE 12h, 34h, 96h, 78h
littleEndian DWORD ?

.CODE
main PROC
    MOVZX EAX, BYTE PTR bigEndian + 3  ; Load the most significant byte (78h) and zero-extend it to 32 bits
    SHL EAX, 24  ; Shift the byte to the most significant position
    MOVZX EBX, BYTE PTR bigEndian + 2  ; Load the second most significant byte (96h) and zero-extend it to 32 bits
    SHL EBX, 16  ; Shift the byte to the second most significant position
    MOVZX ECX, BYTE PTR bigEndian + 1  ; Load the second least significant byte (34h) and zero-extend it to 32 bits
    SHL ECX, 8  ; Shift the byte to the second least significant position
    MOVZX EDX, BYTE PTR bigEndian  ; Load the least significant byte (12h) and zero-extend it to 32 bits
    OR EAX, EBX  ; Combine the bytes using OR operations
    OR EAX, ECX
    OR EAX, EDX
    MOV littleEndian, EAX  ; Store the result in littleEndian

    ; Display the littleEndian value
    MOV ECX, 1
    MOV ESI, OFFSET littleEndian
    CALL WriteHex

    exit
main ENDP

END main
