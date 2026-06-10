; int strcmp(const char *s1, const char *s2);

global ft_strcmp

ft_strcmp:
	mov rcx, 0							; set rcx to 0
	mov rax, 0							; set rax to 0

cmp:
	cmp byte[rdi + rcx], 0				; compare s1[rcx] to \0
	jz done								; if equal jump to done
	cmp byte[rsi + rcx], 0				; compare s2[rcx] to \0
	jz done								; if equal jump to done
	mov al, byte[rsi + rcx]				; move rsi[rcx] to al register, cmp can't take two memory references
	cmp byte[rdi + rcx], al				; compare rsi[rcx] to rdi[rcx]
	jnz done							; if not equal jump to done
	inc rcx								; else increase rcx
	jmp cmp								; repeat cmp

done:
	movzx rax, byte[rdi + rcx]			; move rdi[rcx] to rax
	movzx rdx, byte[rsi + rcx]			; move rsi[rcx] to rax
	sub rax, rdx						; substract rdx to rax
	ret									; return rax