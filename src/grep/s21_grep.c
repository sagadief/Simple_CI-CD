#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int e, i, v, c, l, n, h, s, f, o;
} flags;

typedef struct {
  int cnt_tmps;
  int cnt_files;
  char tmps[200][2048];
  char files[200][1024];
} texts;

int pars_flags(int argc, char **argv, flags *fl);
void pars_files_templates(int argc, char **argv, flags *fl, texts *par);
void just_grep(texts *par, regex_t *mas_reg, flags *fl);
int flag_i(flags *fl);

int main(int argc, char **argv) {
  flags fl = {0};
  texts par = {0};
  if (argc > 2) {
    if (pars_flags(argc, argv, &fl)) {
      pars_files_templates(argc, argv, &fl, &par);
      regex_t *mas_reg = NULL;
      mas_reg = malloc(par.cnt_tmps * sizeof(regex_t));
      for (int i = 0; i < par.cnt_tmps; i++) {
        regcomp(&mas_reg[i], par.tmps[i], flag_i(&fl));
      }
      just_grep(&par, mas_reg, &fl);

      for (int i = 0; i < par.cnt_tmps; i++) {
        regfree(&mas_reg[i]);
      }
      free(mas_reg);
    }
  }
  return 0;
}

void pars_files_templates(int argc, char **argv, flags *fl, texts *par) {
  int flag = 0;
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] == '-') {
      for (int j = 1; j < (int)strlen(argv[i]); j++) {
        if (argv[i][j] == 'e') {
          if (j < (int)strlen(argv[i]) - 1) {
            par->cnt_tmps++;
            strcat(par->tmps[par->cnt_tmps - 1], &argv[i][j + 1]);
          } else {
            par->cnt_tmps++;
            strcat(par->tmps[par->cnt_tmps - 1], argv[i + 1]);
            i++;
          }
          flag = 1;
          break;
        } else if (argv[i][j] == 'f') {
          if (j < (int)strlen(argv[i]) - 1) {
            char sh[2048];
            FILE *file = fopen(&argv[i][j + 1], "r");
            if (file != NULL) {
              while (fgets(sh, sizeof(sh), file) != NULL) {
                int len = strlen(sh);
                if (len > 1 && sh[len - 1] == '\n') {
                  sh[len - 1] = '\0';
                }
                par->cnt_tmps++;
                strcat(par->tmps[par->cnt_tmps - 1], sh);
              }
              fclose(file);
            }
            if (fl->s == 0) {
              fprintf(stderr, "No such file or directory: %s\n", argv[i + 1]);
            }
          } else {
            char sh[2048];
            FILE *file = fopen(argv[i + 1], "r");
            if (file != NULL) {
              while (fgets(sh, sizeof(sh), file) != NULL) {
                int len = strlen(sh);
                if (len > 1 && sh[len - 1] == '\n') {
                  sh[len - 1] = '\0';
                }
                par->cnt_tmps++;
                strcat(par->tmps[par->cnt_tmps - 1], sh);
              }
              fclose(file);
            } else if (fl->s == 0) {
              fprintf(stderr, "No such file or directory: %s\n", argv[i + 1]);
            }
            i++;
          }
          flag = 1;
          break;
        }
      }
    } else if (flag == 1 || fl->e == 1 || fl->f == 1) {
      par->cnt_files++;
      strcat(par->files[par->cnt_files - 1], argv[i]);
    } else if (flag == 0 && fl->e == 0 && fl->f == 0) {
      par->cnt_tmps++;
      strcat(par->tmps[par->cnt_tmps - 1], argv[i]);
      flag++;
    }
  }
}

int pars_flags(int argc, char **argv, flags *fl) {
  int ret = 1;
  if (argc > 1) {
    for (int i = 1; i < argc; i++) {
      if (argv[i][0] == '-') {
        for (int j = 1; j < (int)strlen(argv[i]); j++) {
          if (argv[i][j] == 'e') {
            fl->e = 1;
            if (j < (int)strlen(argv[i]) - 1) {
              break;
            }
          } else if (argv[i][j] == 'i')
            fl->i = 1;
          else if (argv[i][j] == 'v')
            fl->v = 1;
          else if (argv[i][j] == 'c')
            fl->c = 1;
          else if (argv[i][j] == 'l')
            fl->l = 1;
          else if (argv[i][j] == 'n')
            fl->n = 1;
          else if (argv[i][j] == 'h')
            fl->h = 1;
          else if (argv[i][j] == 's')
            fl->s = 1;
          else if (argv[i][j] == 'f') {
            fl->f = 1;
            if (j < (int)strlen(argv[i]) - 1) {
              break;
            }
          } else if (argv[i][j] == 'o') {
            fl->o = 1;
          } else if (fl->s == 0) {
            ret = 0;
            fprintf(stderr,
                    "grep: invalid option -- %c\nusage: grep "
                    "[-chilnosv]\n\t[-e pattern] [-f file]\n",
                    argv[i][j]);
            break;
          }
        }
      }
    }
  }
  return ret;
}

void just_grep(texts *par, regex_t *mas_reg, flags *fl) {
  char sh[2048];
  int match;
  int flag = 0;
  regmatch_t pmatch[1];
  for (int i = 0; i < par->cnt_files; i++) {
    int cnt_c = 0;
    int number_n = 1;
    FILE *file = fopen(par->files[i], "r");
    if (file != NULL) {
      while (fgets(sh, sizeof(sh), file) != NULL) {
        int len = strlen(sh);
        if (len > 0 && sh[len - 1] != '\n') {
          sh[len++] = '\n';
          sh[len] = '\0';
        }
        int count_flag = 0;
        for (int j = 0; j < par->cnt_tmps; j++) {
          match = regexec(&mas_reg[j], sh, 1, pmatch, 0);
          if (fl->v) {
            if (match == 1)
              count_flag++;
            if (match == 1 && count_flag == par->cnt_tmps) {
              match = 0;
            } else {
              match = 1;
            }
          }
          if (fl->l && match == 0) {
            flag = 1;
          }
          if (fl->c && match == 0) {
            cnt_c++;
            break;
          }
          if (match == 0 && fl->l == 0 && fl->c == 0) {
            if ((par->cnt_files) > 1 && fl->h == 0) {
              printf("%s:", par->files[i]);
            }
            if (fl->n) {
              printf("%d:", number_n);
            }
            printf("%s", sh);
            break;
          }
        }
        number_n++;
      }
      if (fl->l && cnt_c > 0) {
        cnt_c = 1;
      }
      if (fl->c) {
        if (par->cnt_files > 1 && fl->h == 0) {
          printf("%s:", par->files[i]);
        }
        printf("%d\n", cnt_c);
      }
      if (fl->l && flag) {
        printf("%s\n", par->files[i]);
      }
      flag = 0;
      fclose(file);
    } else if (fl->s == 0) {
      fprintf(stderr, "No such file or directory:%s\n", par->files[i]);
    }
  }
}

int flag_i(flags *fl) {
  int cflags = REG_EXTENDED;
  if (fl->i) {
    cflags = REG_ICASE;
  }
  return cflags;
}