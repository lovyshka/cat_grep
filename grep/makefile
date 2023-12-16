all : s21_grep

s21_grep:
	gcc -Wall -Werror -Wextra grep.c -o s21_grep

rebuild: clean all

test: s21_grep
	sh test.sh

clean:
	rm s21_grep a.out
