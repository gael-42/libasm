; char *strdup(const char *s);
; rdi = 1st arg
; rsi = 2nd arg
; mov src, dest
; rdx = 3rd int arg
; void *malloc(size_t size);
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

ft_strdup:
; 	; get s size with strlen
; 	; allocate dest with malloc
; 	; copy s to dest with strcpy
; 	; return dest
	call ft_strlen
	push rdi		; strlen will move rdi (*s) pointer, need to save it to the stack
	inc rax			; strlen result is in rax, need to inc to account for \0
	mov rdi, rax	; move result of strlen to 1st arg register for malloc
	call malloc
	cmp rax, 0		; check return value to see if malloc failed
	je error		; if failed go to error
	pop rsi
	mov rdi, rax	; store malloc pointer in 1st arg to send to strcpy
	call ft_strcpy
	ret

error:
	neg rax			; get absoute value of error
	mov rdi, rax	; store value in 1st arg to use rax for errno pointer
	call    __errno_location wrt ..plt	; get pointer to errno
	mov [rax], rdi	; store error code in errno pointer?
	mov rax, -1 	; set error
	pop rsi			; ?
	ret				; return