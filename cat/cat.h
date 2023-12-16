#ifndef C3_SIMPLEBASHUTILS_1_CAT_H
#define C3_SIMPLEBASHUTILS_1_CAT_H

#include <getopt.h>
#include <stdio.h>

struct opt {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
};

void pars(int argc, char **argv, struct opt *str);
void beaty_print(struct opt structure, char *argv[]);

#endif  // C3_SIMPLEBASHUTILS_1_CAT_H
