; char *strdup(const char *s);
; void *malloc(size_t size);
; int * __errno_location(void);

global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

ft_strdup:
	push rdi		; save *s to the stack for later
	call ft_strlen	; get len of string
	inc rax			; strlen result is in rax, need to inc to account for \0
	mov rdi, rax	; move result of strlen to 1st arg register for malloc
	call malloc		; call malloc function
	cmp rax, 0		; check return value to see if malloc failed
	je error		; if failed go to error
	pop rsi			; get *s back from stack and into rsi (2nd arg) for strcpy
	mov rdi, rax	; store malloc pointer in 1st arg to send to strcpy
	call ft_strcpy	; call strcpy
	ret				; return pointer to new string

error:
	neg rax								; get absoute value of error
	mov rdi, rax						; store error value in rdi to use rax for errno pointer
	call    __errno_location wrt ..plt	; get pointer to errno location
	mov [rax], rdi						; store error code in errno pointer in rax
	mov rax, -1 						; set error code
	pop rsi								; remove *s from th stack to realign it an get proper return address
	ret									; return