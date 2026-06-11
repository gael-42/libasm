; ssize_t write(int fd, const void *buf, size_t count);

global ft_write
extern __errno_location

ft_write:
	mov rax, 1			; set write() syscall (1) in rax
	syscall				; call write()
	cmp rax, 0			; check return value
	js set_errno		; if return is negative jump to error handling
	ret					; else return number of bytes written

set_errno:
	neg rax								; get absoute value of error
	mov rdi, rax						; store value in 1st arg to use rax for errno pointer
	call    __errno_location wrt ..plt	; call function to get pointer to errno
	mov [rax], rdi						; store error code in errno pointer in rax
	mov rax, -1 						; set error code
	ret									; return


