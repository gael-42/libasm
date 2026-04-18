; char *strcpy(char *dest, const char *src);

global ft_strcpy

; get str size with strlen
; allocate buffer in .bss
; copy char one by one ?

ft_strcpy:
	mov rax, 0
	jmp copy

copy:
	cmp byte [rdi + rax], 0
	je done
	mov [rdi + rax], rsi
	inc rax
	jmp copy

done:
	mov rsi, rax
	ret