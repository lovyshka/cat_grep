#include "cat.h"

int main(int argc, char **argv) {
  struct opt op_1 = {0};
  pars(argc, argv, &op_1);
  beaty_print(op_1, argv);
  return 0;
}

void pars(int argc, char **argv, struct opt *str) {
  int temp_character;
  int index = 0;
  struct option long_options[] = {{"number-nonblank", 0, NULL, 'b'},
                                  {"number", 0, NULL, 'n'},
                                  {"squeeze-blank", 0, NULL, 's'},
                                  {NULL, 0, NULL, 0}};

  while ((temp_character = getopt_long(argc, argv, "bEnsTvet", long_options,
                                       &index)) != -1) {
    switch (temp_character) {
      case 'e':
        str->e = 1;
        break;
      case 'n':
        str->n = 1;
        break;
      case 'b':
        str->b = 1;
        break;
      case 's':
        str->s = 1;
        break;
      case 't':
        str->t = 1;
        break;
      case 'v':
        str->v = 1;
        break;
      case 'E':
        str->e = 1;
        str->v = 1;
        break;
      case 'T':
        str->t = 1;
        str->v = 1;
        break;
    }
  }
  if (str->b == 1 && str->n == 1) str->n = 0;
}

void beaty_print(struct opt structure, char *argv[]) {
  FILE *fp;
  if ((fp = fopen(argv[optind], "r")) != NULL) {
    char prev_char = -1;
    char prev_prev_char = -1;
    char curr_char;
    int cnt = 1;
    while ((curr_char = fgetc(fp)) != EOF) {
      if (structure.s == 1 && (curr_char == '\n') && (prev_char == '\n') &&
          (prev_prev_char == '\n' || prev_prev_char == -1)) {  // flag s
        prev_prev_char = prev_char;
        prev_char = curr_char;
        continue;
      }
      if (structure.e == 1 && curr_char == '\n') {  // flag e
        printf("$");
      }
      if (structure.n == 1 &&
          (prev_char == '\n' || prev_char == -1)) {  // flag n
        printf("%6d\t", cnt);
        cnt++;
      }
      if (structure.b == 1 && curr_char != '\n' &&
          (prev_char == '\n' || prev_char == -1)) {  // flag b
        printf("%6d\t", cnt);
        cnt++;
      }
      if (structure.t == 1 && curr_char == 9) {  // flag t
        printf("^");
        curr_char = 'I';
      }
      if (structure.v == 1 && (curr_char >= 0 && curr_char <= 31 &&
                               curr_char != '\t' && curr_char != '\n')) {
        curr_char += 64;
        printf("^");
      } else if (curr_char == 127) {
        curr_char -= 64;
        printf("^");
      }
      printf("%c", curr_char);
      prev_prev_char = prev_char;
      prev_char = curr_char;
    }
    fclose(fp);
  } else
    printf("s21_cat: %s: No such file or directory\n", argv[optind]);
}
