; size_t strlen(const char *s);

global ft_strlen

ft_strlen:
	mov rax, 0
	jmp count

count:
	cmp byte [rdi + rax], 0
	je done
	inc rax
	jmp count

done:
	ret