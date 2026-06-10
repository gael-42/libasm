; char *strcpy(char *dest, const char *src);

global ft_strcpy

ft_strcpy:
	mov rax, 0	; set rax to 0
	jmp copy	; start copy loop

copy:
	cmp byte [rsi + rax], 0	; compare current char rsi[rax] in src with \0
	je done					; if equal exit loop to done
	mov dl, [rsi + rax]		; if not copy current src char to dl register (8 bit part of rdx)
	mov [rdi + rax], dl		; copy dl char to dest[rax]
	inc rax					; inc rax (used to iterate like i++)
	jmp copy				; repeat loop

done:
	mov byte [rdi + rax], 0	; add \0 at the end of dest
	mov rax, rdi			; move dest pointer to rax
	ret						; return rax