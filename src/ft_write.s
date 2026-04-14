; ssize_t write(int fd, const void *buf, size_t count);

global ft_write

ft_write:
	mov rcx, 0
	mov rax, 1
	syscall
	inc rcx
	mov rcx, rax
	cmp rcx, rdx
	je done

set_errno:


done:
	ret