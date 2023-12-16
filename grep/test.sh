#!bin/bash

echo "--------TEST 1------------"
echo "without any flag, searching for word [name] in single file"
./s21_grep name ../../datasets/grep_test/long_file.txt > file_1.log
grep name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then 
    echo "SUCCESS"
else 
    echo "FAIL"
    fi

echo "--------TEST 2------------"
echo "i flag, searhcing for word [name] in sigle file"
./s21_grep -i name ../../datasets/grep_test/long_file.txt > file_1.log
grep -i name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then 
    echo "SUCCESS"
else 
    echo "FAIL"
    fi

echo "--------TEST 3------------"
echo "v flag, searhcing for word [name] in sigle file"
./s21_grep -v name ../../datasets/grep_test/long_file.txt > file_1.log
grep -v name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then 
    echo "SUCCESS"
else 
    echo "FAIL"
    fi

echo "--------TEST 4------------"
echo "c flag, searhcing for word [name] in sigle file"
./s21_grep -c name ../../datasets/grep_test/long_file.txt > file_1.log
grep -c name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 5------------"
echo "l flag, searhcing for word [name] in sigle file"
./s21_grep -l name ../../datasets/grep_test/long_file.txt > file_1.log
grep -l name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 6------------"
echo "n flag, searhcing for word [name] in sigle file"
./s21_grep -n name ../../datasets/grep_test/long_file.txt > file_1.log
grep -n name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 7------------"
echo "h flag, searhcing for word [name] in sigle file"
./s21_grep -h name ../../datasets/grep_test/long_file.txt > file_1.log
grep -h name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 8------------"
echo "o flag, searhcing for word [name] in sigle file"
./s21_grep -o name ../../datasets/grep_test/long_file.txt > file_1.log
grep -o name ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 9------------"
echo "s flag, searhcing for word [name] in sigle file"
./s21_grep -s name ../../datasets/grep_test/long_file_.txt > file_1.log
grep -s name ../../datasets/grep_test/long_file_.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 10------------"
echo "f flag, searhcing for word [name] in sigle file"
./s21_grep -f pat.txt ../../datasets/grep_test/long_file.txt > file_1.log
grep -f pat.txt ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 11------------"
echo "e flag, searching for word [name] by regexp na.e in single file"
./s21_grep -e na.e ../../datasets/grep_test/long_file.txt > file_1.log
grep -e na.e ../../datasets/grep_test/long_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi


echo "--------TEST 12------------"
echo "e flag, searhcing for word [name] by regexp na.e in multiple files"
./s21_grep -e na.e ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -e na.e ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 13------------"
echo "without any flag, searching for word [name] in multiple files"
./s21_grep name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 14------------"
echo "i flag, searhcing for word [name] in multiple files"
./s21_grep -i name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -i name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi


echo "--------TEST 15------------"
echo "v flag, searhcing for word [name] in multiple files"
./s21_grep -v name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -v name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi


echo "--------TEST 16------------"
echo "c flag, searhcing for word [name] in multiple files"
./s21_grep -c name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -c name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 17------------"
echo "l flag, searhcing for word [name] in multiple files"
./s21_grep -l name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -l name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 18------------"
echo "n flag, searhcing for word [name] in multiple files"
./s21_grep -n name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -n name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 19------------"
echo "h flag, searhcing for word [name] in multiple files"
./s21_grep -h name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -h name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 20------------"
echo "o flag, searhcing for word [name] in multiple files"
./s21_grep -o name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -o name ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 21------------"
echo "s flag, searhcing for word [name] in multiple files"
./s21_grep -s name ../asd.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -s name ../asd.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

echo "--------TEST 22------------"
echo "f flag, searhcing for word [name] in multiple files"
./s21_grep -f pat.txt ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_1.log
grep -f pat.txt ../../datasets/grep_test/long_file.txt ../../datasets/grep_test/short_file.txt > file_2.log

if cmp -s file_1.log file_2.log;
then
    echo "SUCCESS"
else
    echo "FAIL"
    fi

rm file_*