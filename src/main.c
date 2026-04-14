#include "libasm.h"

extern size_t ft_strlen(const char* str);
extern ssize_t ft_write(int fd, const void *buf, size_t count);

void test_ft_write() {
	char *test = "Test ft_write";
	printf(" | %ld = ft_write\n", ft_write(1, test, strlen(test)));
	printf(" | %ld = write\n", write(1, test, strlen(test)));
	int result = ft_write(-42, test, strlen(test));
	if (result < 0) {
		printf("errno value : %d\n", errno);
		printf("%s\n", strerror(errno));
	}
}

void test_ft_strlen(char *str) {
	int size = ft_strlen(str);
	printf("str = %s, size = %d, strlen = %ld\n", str, size, strlen(str));
}

int main() {
printf("Tests ft_strlen\n");
test_ft_strlen("Hello world!");
test_ft_strlen("hi");
test_ft_strlen("");
test_ft_write();
return 0;
}