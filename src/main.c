#include "libasm.h"

extern size_t ft_strlen(const char* str);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern char *ft_strdup(const char *s);


void test_ft_strdup() {
	char *s1 = "Hello1";
	char *og;
	char *test;
	test = ft_strdup(s1);
	og = strdup(s1);
	printf("strdup = %s\n", og);
	printf("ft_strdup = %s\n", test);
	free(og);
	free(test);
}

void test_ft_strcmp() {
	char *s1 = "Hello1";
	char *s2 = "Hello5";

	printf("strcmp = %d\n", strcmp(s1,s2));
	printf("ft_strcmp = %d\n", ft_strcmp(s1,s2));
}

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
test_ft_strcmp();
test_ft_strdup();
return 0;
}