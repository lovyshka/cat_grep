#include "grep.h"

int main(int argc, char *argv[]) {
  struct opt op = {0};

  pars(argc, argv, &op);

  reader(argc, argv, op);

  return 0;
}

void pars(int argc, char **argv, struct opt *kek) {  // жоско парсим флажки
  int temp_char;
  int index = 0;
  struct option long_options[] = {{NULL, 0, NULL, 0}};

  while ((temp_char = getopt_long(argc, argv, "eivclnhsfo", long_options,
                                  &index)) != -1) {
    switch (temp_char) {
      case 'i':
        kek->i = 1;
        break;
      case 'e':
        kek->e = 1;
        break;
      case 'v':
        kek->v = 1;
        break;
      case 'c':
        kek->c = 1;
        break;
      case 'l':
        kek->l = 1;
        break;
      case 'n':
        kek->n = 1;
        break;
      case 'h':
        kek->h = 1;
        break;
      case 's':
        kek->s = 1;
        kek->e = 1;
        break;
      case 'f':
        kek->f = 1;
        kek->e = 1;
        break;
      case 'o':
        kek->o = 1;
        break;
      case '?':
        kek->error = 1;
        break;
    }
  }
  if (optind == 1) kek->simple = 1;
  if (kek->e == 1 && kek->v == 1) kek->e = 0;
}

void reader(int argc, char *argv[], struct opt op) {
  char *buffer = NULL;  // место для копирования строки из getline

  char pattern[1000];

  if (op.f == 1) {
    FILE *f = fopen(argv[optind], "r");
    if (f != NULL) {
      char sas[1000] = "\0";
      fread(sas, 1, 1000, f);
      strcpy(pattern, sas);
      fclose(f);
    } else
      printf("error, cant open file with pattern\n");

  } else {
    strcpy(pattern, argv[optind]);
  }

  int number_of_files = argc - (optind + 1);  // считаем количество файлов
                                              //  для цикла и для кайфа)

  regex_t reeg_exp_i;  // переменная для регулярки
  regex_t reeg_exp_for_e;

  regcomp(&reeg_exp_for_e, pattern, REG_EXTENDED);
  regcomp(&reeg_exp_i, pattern, REG_ICASE);  // компилим регулярку для флага i

  for (int i = 1; i <= number_of_files; i++) {
    char filename[1000] = "\0";
    strcpy(filename, argv[optind + i]);  // берем имя файла из строки

    FILE *stream = fopen(filename, "r");
    size_t len;

    if (stream == NULL) {
      if (op.s == 0) {
        printf("error in reading file %s\n", filename);
        continue;
      } else if (op.s == 1) {
        ;
      }
    } else {
      size_t read;
      int cnt = 0;  // счетчик совпадений в строка для флага -с
      int number_of_line = 0;  // номер строки в файле
      while ((int)(read = getline(&buffer, &len, stream)) !=
             -1) {  // копируем пока копируется
        int rez = finder(buffer, pattern);
        int rez_for_e = regexec(
            &reeg_exp_for_e, buffer, 0, NULL,
            0);  // если нашли подстроку в строке для всех флагов кроме i
        int rez_for_i_flag =
            regexec(&reeg_exp_i, buffer, 0, NULL,
                    0);  // если нашли подстроку в строке для флага i

        number_of_line++;
        if (rez == 1) cnt++;
        if (buffer[strlen(buffer) - 1] != '\n')
          strcat(buffer, "\n");  //для проблем с окончанием строки

        if (op.simple == 1 && rez == 1 && number_of_files == 1) {
          printf("%s", buffer);
        } else if (op.simple == 1 && rez == 1 && number_of_files > 1) {
          printf("%s:%s", filename, buffer);
        }
        if (op.e == 1 && rez_for_e == 0 &&
            number_of_files == 1) {  // просто паттерн
          printf("%s", buffer);
        } else if (op.e == 1 && rez_for_e == 0 && number_of_files > 1) {
          printf("%s:%s", filename, buffer);
        }

        if (op.o == 1 && rez == 1 &&
            number_of_files == 1) {  // по сути, просто печать паттерна столько
                                     // раз сколько он встретился в тексте
          printf("%s\n", pattern);
        } else if (op.o == 1 && rez == 1 && number_of_files > 1) {
          printf("%s:%s\n", filename, pattern);
        }

        if (op.h == 1 && rez == 1) {
          printf("%s", buffer);
        }

        if (op.v == 1 && rez == 0 &&
            number_of_files == 1) {  // инверсия смысла поиска
          printf("%s", buffer);
        } else if (op.v == 1 && rez == 0 && number_of_files > 1) {
          printf("%s:%s", filename, buffer);
        }

        if (op.i == 1 && rez_for_i_flag == 0 &&
            number_of_files == 1) {  // игнорирование регистра
          printf("%s", buffer);
        } else if (op.i == 1 && rez_for_i_flag == 0 && number_of_files > 1) {
          printf("%s:%s", filename, buffer);
        }

        if (op.n == 1 && rez == 1 &&
            number_of_files == 1) {  // нумеруем выходные строки
          printf("%d:%s", number_of_line, buffer);
        } else if (op.n == 1 && rez == 1 && number_of_files > 1) {
          printf("%s:%d:%s", filename, number_of_line, buffer);
        }

        if (op.l == 1 && rez == 1) {  // просто вывод имени файла
          printf("%s\n", filename);
          break;
        }
      }
      if (op.c && number_of_files > 1)
        printf("%s:%d\n", filename, cnt);
      else if (op.c && number_of_files == 1)
        printf("%d\n", cnt);

      fclose(stream);
    }
  }
  free(buffer);
  regfree(&reeg_exp_i);
  regfree(&reeg_exp_for_e);
}

int finder(const char *buffer, char *pattern) {
  int ans = 0;  // 0 - no mathcing , 1 - there are mathcing
  if (strstr(buffer, pattern) != NULL) ans = 1;
  return ans;
}

// это место для доски позора, пожалуйста, когда проходите мимо этой функции -
// плюньте в нее она отняла много моего времени(она выкидывает сегфолт) ((я так
// и не разобрался почему))
// void make_low_case_string(char * input) {
//   for (int i = 0; i < strlen(input); ++i) {
//     if (input[i] >= 65 && input[i] <= 90) input[i] += 32;
//   }
// }
