#include "libasm.h"

extern size_t ft_strlen(const char* str);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern char *ft_strcpy(char *dest, const char *src);

void test_ft_strcpy(char *src) {
	char dest[1000];
	memset(dest, 0, 1000);
	char *result = ft_strcpy(dest, src);

	printf("FT_STRCPY\n");
	printf("strcpy = %s\n", strcpy(dest, src));
	printf("ft_strcpy = %s\n", result);
}

void test_ft_write(char *src) {
	printf("FT_WRITE\n");
	printf(" | %ld = ft_write\n", ft_write(1, src, strlen(src)));
	printf(" | %ld = write\n", write(1, src, strlen(src)));
	
	int test_errno = ft_write(-42, src, strlen(src));
	if (test_errno < 0) {
		printf("errno value : %d\n", errno);
		printf("%s\n", strerror(errno));
	}
}

void test_ft_strlen(char *str) {
	int size = ft_strlen(str);
	printf("FT_STRLEN\n");
	printf("str = %s, size = %d, strlen = %ld\n", str, size, strlen(str));
}

int main() {
test_ft_strlen("Hello world!");
test_ft_strlen("hi");
test_ft_strlen("");
test_ft_write("Please write this");
test_ft_write("");
test_ft_strcpy("Please copy this");
test_ft_strcpy("");
return 0;
}