#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct flags {
  int b, e, n, s, t, v, E, T;
};
int parser(int argc, char **argv, struct flags *fl);
void output_fls(FILE *file, struct flags fl);
int flag_s(char c, int res);
int flag_n(int cnt_str);
int main(int argc, char **argv) {
  struct flags fl = {0, 0, 0, 0, 0, 0, 0, 0};
  parser(argc, argv, &fl);
  if (argc > 1 && parser(argc, argv, &fl) == 0) {
    if (fl.b == 1) fl.n = 0;
    for (int i = 1; i < argc; i++) {
      if (argv[i][0] == '-') {
        continue;
      } else {
        FILE *file = fopen(argv[i], "r");
        if (file != NULL) {
          output_fls(file, fl);
          fclose(file);
        } else {
        }
      }
    }
  }
  return 0;
}
int parser(int argc, char **argv, struct flags *fl) {
  if (argc > 1) {
    for (int i = 1; i < argc; i++) {
      if (argv[i][0] == '-') {
        if (argv[i][1] == '-') {
          if (strcmp(argv[i], "--number-nonblank") == 0) {
            fl->b = 1;
          } else if (strcmp(argv[i], "--number") == 0) {
            fl->n = 1;
          } else if (strcmp(argv[i], "--squeeze-blank") == 0) {
            fl->s = 1;
          } else {
            return 1;
          }
        }
        for (long unsigned int j = 1; j < strlen(argv[i]); j++) {
          if (argv[i][j] == 'b') {
            fl->b = 1;
          } else if (argv[i][j] == 'e') {
            fl->e = 1;
            fl->v = 1;
          } else if (argv[i][j] == 'n') {
            fl->n = 1;
          } else if (argv[i][j] == 's') {
            fl->s = 1;
          } else if (argv[i][j] == 't') {
            fl->t = 1;
            fl->v = 1;
          } else if (argv[i][j] == 'E') {
            fl->E = 1;
          } else if (argv[i][j] == 'T') {
            fl->T = 1;
          } else if (argv[i][j] == 'v') {
            fl->v = 1;
          }
        }
      } else {
        break;
      }
    }
  } else {
    printf("no have any args");
  }

  return 0;
}

void output_fls(FILE *file, struct flags fl) {
  int ch;
  int len = 1;
  int number = 1;
  char *str = (char *)malloc(sizeof(char));
  str[0] = '\0';
  while (1) {
    ch = fgetc(file);
    if (ch == EOF) {
      break;
    }
    str = (char *)realloc(str, (len) * sizeof(char));
    str[len - 1] = (char)ch;
    len++;
  }

  for (int i = 0; i < len - 1; i++) {
    if (fl.s == 1 && str[i] == '\n' && str[i + 1] == '\n' &&
        (i == 0 || (str[i - 1] == '\n' && i != 0))) {
      continue;
    }
    if (i == 0 && fl.b == 1 && str[i] != '\n') printf("%6d\t", number++);
    if (i == 0 && fl.n == 1) printf("%6d\t", number++);
    if ((fl.e == 1 || fl.E == 1) &&
        (str[i] == '\n' || (str[i] == '\0' && i == len - 1))) {
      printf("$");
    }
    if (fl.t == 1 || fl.T == 1) {
      if (str[i] == '\t') {
        printf("^I");
        continue;
      }
    }
    if (fl.v == 1) {
      if (str[i] < 32 && str[i] != 9 && str[i] != 10) {
        printf("^%c", str[i] + 64);
        continue;
      } else if (str[i] == 127) {
        printf("^%c", str[i] - 64);
        continue;
      }
    }
    printf("%c", str[i]);
    if (i != len - 2) {
      if (fl.b == 1 && str[i] == '\n' && str[i + 1] != '\n')
        printf("%6d\t", number++);
      if (fl.n == 1 && str[i] == '\n') printf("%6d\t", number++);
    }
  }
  free(str);
}
