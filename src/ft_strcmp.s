; int strcmp(const char *s1, const char *s2);
; ret 0 if equal, <0 if s1 < s2, >0 if s1>s2
; rdi = s1, rsi = s2

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
	mov rax, 0							; set rax to 0
	jmp compare							; start comparison loop

compare:
	cmp byte[rsi + rax], 0				; compare s1[rax] to \0
	je substract						; if equal jump to substract
	cmp byte[rdi + rax], 0				; else compare s2[rax] tp \0
	je substract						; if equal jump to substract
	mov dl, [rdi + rax]
	cmp byte [rsi + rax], dl			; else compare rsi[rax] to rdo[rax]
	jne substract						; if not equal jump to substract
	inc rax								; rax++
	jmp compare							; loop

substract:
	mov dl, [rdi + rax]					; store rsi[rax] in dl
	mov cl, [rsi + rax]					; store rdi[rax] in cl
	sub dl, cl							; substract cl to dl (result stored in dl)
	movzx rax, dl						; move dl to rax
	ret									; return rax

