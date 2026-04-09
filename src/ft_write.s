; ssize_t write(int fd, const void *buf, size_t count);

; section .data
section .text
	global _start:.
_start:
mov rax, 1
; mov rsi, buf
; mov rdx, len
syscall