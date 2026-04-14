; ssize_t write(int fd, const void *buf, size_t count);

global ft_write
extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	js set_errno
	ret

set_errno:
	neg rax
	mov rdi, rax
	call    __errno_location wrt ..plt
	mov [rax], rdi
	mov rax, -1
	ret
