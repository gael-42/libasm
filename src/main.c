#include "libasm.h"

extern size_t ft_strlen(const char* str);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern char *ft_strdup(const char *s);
extern ssize_t ft_read(int fd, void *buf, size_t count);

void test_ft_read() {
	char buff1[1000];
	memset(buff1, 0, 1000);
	char buff2[1000];
	memset(buff2, 0, 1000);
	int fd = open("src/ft_strdup.s", O_RDONLY);
	if (fd == -1) {
		printf("Error: %s\n", strerror(errno));
		return;
	}
	printf("READ = %ld\n%s\n", read(fd, buff1, 100), buff1);
	printf("FT_READ = %ld\n%s\n", ft_read(fd, buff2, 100), buff2);
	close(fd);
}

void test_ft_strdup() {
	char *s1 = "Hello1";
	char *og;
	char *test;
	test = ft_strdup(s1);
	og = strdup(s1);
	printf("STRDUP = %s\n", og);
	printf("FT_STRDUP = %s\n", test);
	free(og);
	free(test);
}

void test_ft_strcmp() {
	char *s1 = "Hello1";
	char *s2 = "Hello5";

	printf("STRCMP = %d\n", strcmp(s1,s2));
	printf("FT_STRCMP = %d\n", ft_strcmp(s1,s2));
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
test_ft_read();
return 0;
}