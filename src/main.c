#include "libasm.h"

extern size_t ft_strlen(const char* str);

void test_ft_strlen(char *str) {
	int size = ft_strlen(str);
	printf("str = %s, size = %d, strlen = %ld\n", str, size, strlen(str));
}

int main() {
printf("Tests ft_strlen\n");
test_ft_strlen("Hello world!");
test_ft_strlen("hi");
test_ft_strlen("");
return 0;
}