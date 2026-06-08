ASM         = nasm
AR          = ar
RANLIB      = ranlib
ASM_FLAGS   = -g -f elf64
NAME        = libasm.a

ASM_SRC     =	src/ft_strlen.s \
				src/ft_write.s \
				src/ft_strcpy.s \
				src/ft_strcmp.s \
				src/ft_strdup.s
ASM_OBJ     = $(ASM_SRC:.s=.o)

CC          = gcc
C_FLAGS     = -Wall -Wextra -Werror -g3
TEST_INCLUDE = -I src/
TEST_SRC    = src/main.c
TEST_OBJ    = $(TEST_SRC:.c=.o)
TEST_NAME   = unit_tests

all: $(NAME) $(TEST_NAME)

$(NAME): $(ASM_OBJ)
	$(AR) rcs $@ $^
	$(RANLIB) $@

$(TEST_NAME): $(TEST_OBJ) $(NAME)
	$(CC) $(C_FLAGS) $(TEST_INCLUDE) -o $@ $^

src/%.o: src/%.s
	$(ASM) $(ASM_FLAGS) -o $@ $<

src/%.o: src/%.c
	$(CC) $(C_FLAGS) -c $(TEST_INCLUDE) -o $@ $<

clean:
	rm -f $(ASM_OBJ) $(TEST_OBJ)

fclean: clean
	rm -f $(NAME) $(TEST_NAME)

re: fclean all