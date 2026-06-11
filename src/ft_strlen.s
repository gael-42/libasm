; size_t strlen(const char *s);

global ft_strlen

ft_strlen:
	mov rax, 0				; set rax to 0
	jmp count				; start counting loop

count:
	cmp byte [rdi + rax], 0	; compare s[rax] to '\0'
	je done					; if equal jump to done
	inc rax					; if not increment rax
	jmp count				; loop

done:
	ret						; return rax = length of *s