#include "libasm.h"

extern size_t ft_strlen(const char* str);
extern ssize_t ft_write(int fd, const void *buf, size_t count);

void test_ft_strlen(char *str) {
	int size = ft_strlen(str);
	printf("str = %s, size = %d, strlen = %ld\n", str, size, strlen(str));
}

int main() {
printf("Tests ft_strlen\n");
test_ft_strlen("Hello world!");
test_ft_strlen("hi");
test_ft_strlen("");
ft_write(1, "Test ft_write\n", 15);
return 0;
}