CC = gcc -Wall -Werror -Wextra

all: clean build

s21_cat:
	$(CC) s21_cat.c -o s21_cat

build: s21_cat

clean:
	rm -rf s21_cat

test:
	bash test_func_cat.sh

leaks:
	bash test_leak_cat.sh

check:
	cp ../../materials/linters/.clang-format ../cat
	clang-format -n s21_cat.c