#ifndef C3_SIMPLEBASHUTILS_1_GREP_H
#define C3_SIMPLEBASHUTILS_1_GREP_H

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct opt {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int error;
  int simple;
};

void pars(int argc, char **argv, struct opt *str);
void reader(int argc, char *argv[], struct opt op);
int finder(const char *buffer, char *pattern);
void make_low_case_string(char *input);

#endif  // C3_SIMPLEBASHUTILS_1_GREP_H
