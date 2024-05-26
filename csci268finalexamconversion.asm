; CSCI268 - Final Exam - Converting from Big Endian to Little Endian
; Miranda Morris
; 4/18/2024
; This code is meant to use the variables below in order to copy the value from 
; bigEndian to littleEndian, while also reversing the order of the bytes. 
; The provided number's 32-bit value is understood to be 12345678 hexadecimal.

.586
.model flat, stdcall
option casemap : none; case-sensitive

ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code

main proc
	mov al, [bigEndian + 3] ;moves 78h to al
	mov BYTE PTR [littleEndian], al ; makes byte pointer to littleEndian
	mov al, [bigEndian + 2] ; moves 56h to al
	mov BYTE PTR [littleEndian + 1], al ; makes byte pointer to littleEndian + 1
	mov al, [bigEndian + 1] ; moves 34h to al
	mov BYTE PTR [littleEndian + 2], al ; makes byte pointer to littleEndian + 2
	mov al, [bigEndian] ; moves 12h to al
	mov BYTE PTR [littleEndian + 3], al ; makes byte pointer to littleEndian + 3

	invoke ExitProcess,0
main endp
	
end main