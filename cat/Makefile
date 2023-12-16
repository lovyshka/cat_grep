all: s21_cat test

s21_cat:
	gcc -Wall -Wextra -Werror cat.c -o s21_cat

clean:
	rm s21_cat file_1.log file_2.log

rebuild: clean s21_cat


test: s21_cat
	sh test.sh