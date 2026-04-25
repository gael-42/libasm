; int strcmp(const char *s1, const char *s2);
; ret 0 if equal, <0 if s1 < s2, >0 if s1>s2
; rsi = s1, rdi = s2

; int	ft_strncmp(char *s1, char *s2, unsigned int n)
; {
; 	unsigned int	i;

; 	i = 0;
; 	if (n == 0)
; 		return (0);
; 	while (i < n && (s1[i] || s2[i]))
; 	{
; 		if (s1[i] != s2[i])
; 			return ((unsigned char)s1[i] - (unsigned char)s2[i]);
; 		i++;
; 	}
; 	return (0);
; }

global ft_strcmp

ft_strcmp:
	mov rax, 0
	jmp compare

compare:
	cmp byte[rsi + rax], 0
	je substract
	cmp byte[rdi + rax], 0
	je substract
	cmp byte [rsi + rax], [rdi + rax]
	jne substract
	inc rax
	jmp compare

substract:
	mov [rsi + rax], dl
	mov [rdi + rax], cl
	sub dl, cl
	mov dl, rax
	ret

