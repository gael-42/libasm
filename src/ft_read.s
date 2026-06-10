; ssize_t read(int fd, void *buf, size_t count);

global ft_read
extern	__errno_location

ft_read:
	mov rax, 0	; set rax to 0 = read() syscall
	syscall		; call read
	cmp rax, 0	; see if read failed
	je error	; go to error handling if failed
	ret			; return

error:
	neg rax								; get absoute value of error
	mov rdi, rax						; store value in 1st arg to use rax for errno pointer
	call    __errno_location wrt ..plt	; call function to get pointer to errno
	mov [rax], rdi						; store error code in errno pointer in rax
	mov rax, -1 						; set error code
	ret									; return

