#!/bin/bash

echo "--------TEST 1------------"
echo "symply output of file ../../datasets/cat_test/sas.txt"
./s21_cat ../../datasets/cat_test/sas.txt > file_1.log
cat  ../../datasets/cat_test/sas.txt > file_2.log


if cmp -s file_1.log file_2.log;
then
  echo "SUCCESS"
else
  echo "FAIL"
  fi

echo "--------TEST 2------------"
echo "test of the all flags without v"
./s21_cat  -ebnst ../../datasets/cat_test/case1.txt > file_1.log
cat  -ebnst ../../datasets/cat_test/case1.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
  echo "SUCCESS"
else
  echo "FAIL"
  fi

echo "--------TEST 3------------"
echo "test single flag v"
./s21_cat  -v ../../datasets/cat_test/case2.txt > file_1.log
cat -v ../../datasets/cat_test/case2.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
  echo "SUCCESS"
else
  echo "FAIL"
  fi

echo "--------TEST 4------------"
echo "test long parameters"
./s21_cat  --squeeze-blank --number --number-nonblank ../../datasets/cat_test/sas.txt > file_1.log
cat -snb ../../datasets/cat_test/sas.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
  echo "SUCCESS"
else
  echo "FAIL"
  fi



rm file_*
