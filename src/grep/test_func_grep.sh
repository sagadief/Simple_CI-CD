#!/bin/bash

# SUCCESS=0
# FAIL=0
# COUNTER=0
# DIFF_RES=""

# declare -a tests=(
# "s test_0_grep.txt VAR"
# "for s21_grep.c s21_grep.h Makefile VAR"
# "for s21_grep.c VAR"
# "-e for -e ^int s21_grep.c s21_grep.h Makefile VAR"
# "-e for -e ^int s21_grep.c VAR"
# "-e regex -e ^print s21_grep.c VAR -f test_ptrn_grep.txt"
# "-e while -e void s21_grep.c Makefile VAR -f test_ptrn_grep.txt"
# )

# declare -a extra=(
# "-n for test_1_grep.txt test_2_grep.txt"
# "-n for test_1_grep.txt"
# "-n -e ^\} test_1_grep.txt"
# "-c -e \/ test_1_grep.txt"
# "-ce ^int test_1_grep.txt test_2_grep.txt"
# "-e ^int test_1_grep.txt"
# "-nivh = test_1_grep.txt test_2_grep.txt"
# "-e"
# "-ie INT test_5_grep.txt"
# "-echar test_1_grep.txt test_2_grep.txt"
# "-ne = -e out test_5_grep.txt"
# "-iv int test_5_grep.txt"
# "-in int test_5_grep.txt"
# "-c -l aboba test_1_grep.txt test_5_grep.txt"
# "-v test_1_grep.txt -e ank"
# "-ne ) test_5_grep.txt"
# "-l for test_1_grep.txt test_2_grep.txt"
# "-e int test_4_grep.txt"
# "-e = -e out test_5_grep.txt"
# "-ne ing -e as -e the -e not -e is test_6_grep.txt"
# "-e ing -e as -e the -e not -e is test_6_grep.txt"
# "-l for no_file.txt test_2_grep.txt"
# "-f test_3_grep.txt test_5_grep.txt"
# )

# testing()
# {
#     t=$(echo $@ | sed "s/VAR/$var/")
#     ./s21_grep $t > test_s21_grep.log
#     grep $t > test_sys_grep.log
#     DIFF_RES="$(diff -s test_s21_grep.log test_sys_grep.log)"
#     (( COUNTER++ ))
#     if [ "$DIFF_RES" == "Files test_s21_grep.log and test_sys_grep.log are identical" ]
#     then
#       SUCCESS=$((SUCCESS+1))
#       echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[32msuccess\033[0m grep $t"
#     else
#       FAIL=$((FAIL+1))
#       echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[31mfail\033[0m grep $t"
#     fi
#     rm test_s21_grep.log test_sys_grep.log
# }

# # специфические тесты
# for i in "${extra[@]}"
# do
#     var="-"
#     testing $i
# done

# # 1 параметр
# for var1 in v c l n h
# do
#     for i in "${tests[@]}"
#     do
#         var="-$var1"
#         testing $i
#     done
# done

# # 2 параметра
# for var1 in v c l n h
# do
#     for var2 in v c l n h
#     do
#         if [ $var1 != $var2 ]
#         then
#             for i in "${tests[@]}"
#             do
#                 var="-$var1 -$var2"
#                 testing $i
#             done
#         fi
#     done
# done

# # 3 параметра
# for var1 in v c l n h
# do
#     for var2 in v c l n h
#     do
#         for var3 in v c l n h
#         do
#             if [ $var1 != $var2 ] && [ $var2 != $var3 ] && [ $var1 != $var3 ]
#             then
#                 for i in "${tests[@]}"
#                 do
#                     var="-$var1 -$var2 -$var3"
#                     testing $i
#                 done
#             fi
#         done
#     done
# done

# # 2 сдвоенных параметра
# for var1 in v c l n h
# do
#     for var2 in v c l n h
#     do
#         if [ $var1 != $var2 ]
#         then
#             for i in "${tests[@]}"
#             do
#                 var="-$var1$var2"
#                 testing $i
#             done
#         fi
#     done
# done

# # 3 строенных параметра
# for var1 in v c l n h
# do
#     for var2 in v c l n h
#     do
#         for var3 in v c l n h
#         do
#             if [ $var1 != $var2 ] && [ $var2 != $var3 ] && [ $var1 != $var3 ]
#             then
#                 for i in "${tests[@]}"
#                 do
#                     var="-$var1$var2$var3"
#                     testing $i
#                 done
#             fi
#         done
#     done
# done

# echo "\033[31mFAIL: $FAIL\033[0m"
# echo "\033[32mSUCCESS: $SUCCESS\033[0m"
# echo "ALL: $COUNTER"

############################################################
#!/bin/bash

# SUCCESS=0
# FAIL=0
# COUNTER=0
# DIFF_RES=""

# testing() {
#     t=$(echo $@ | sed "s/VAR/$var/")
#     ./s21_grep $t > test_s21_grep.log
#     grep $t > test_sys_grep.log
#     DIFF_RES="$(diff -s test_s21_grep.log test_sys_grep.log)"
#     let COUNTER++
#     if [ "$DIFF_RES" = "Files test_s21_grep.log and test_sys_grep.log are identical" ]; then
#         let SUCCESS++
#         echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[32msuccess\033[0m grep $t"
#     else
#         let FAIL++
#         echo "\033[31m$FAIL\033[0m/\033[32m$SUCCESS\033[0m/$COUNTER \033[31mfail\033[0m grep $t"
#     fi
#     rm test_s21_grep.log test_sys_grep.log
# }

# # специфические тесты
# for i in \
# "-n for test_1_grep.txt test_2_grep.txt" \
# "-n for test_1_grep.txt" \
# "-n -e ^\} test_1_grep.txt" \
# "-c -e \/ test_1_grep.txt" \
# "-ce ^int test_1_grep.txt test_2_grep.txt" \
# "-e ^int test_1_grep.txt" \
# "-nivh = test_1_grep.txt test_2_grep.txt" \
# "-e" \
# "-ie INT test_5_grep.txt" \
# "-echar test_1_grep.txt test_2_grep.txt" \
# "-ne = -e out test_5_grep.txt" \
# "-iv int test_5_grep.txt" \
# "-in int test_5_grep.txt" \
# "-c -l aboba test_1_grep.txt test_5_grep.txt" \
# "-v test_1_grep.txt -e ank" \
# "-ne ) test_5_grep.txt" \
# "-l for test_1_grep.txt test_2_grep.txt" \
# "-e int test_4_grep.txt" \
# "-e = -e out test_5_grep.txt" \
# "-ne ing -e as -e the -e not -e is test_6_grep.txt" \
# "-e ing -e as -e the -e not -e is test_6_grep.txt" \
# "-l for no_file.txt test_2_grep.txt" \
# "-f test_3_grep.txt test_5_grep.txt"
# do
#     var="-"
#     testing $i
# done

# # параметры v c l n h
# params=(v c l n h)

# # циклы для 1, 2, 3 сдвоенных параметров
# for i in $(seq 1 3); do
#     for combination in $(echo ${params[@]} | tr ' ' '\n' | tr -d '\n' | grep -o . | uniq | tr -d '\n'); do
#         if [ "${#combination}" -eq "$i" ]; then
#             for i in \
#             "s test_0_grep.txt VAR" \
#             "for s21_grep.c s21_grep.h Makefile VAR" \
#             "for s21_grep.c VAR" \
#             "-e for -e ^int s21_grep.c s21_grep.h Makefile VAR" \
#             "-e for -e ^int s21_grep.c VAR" \
#             "-e regex -e ^print s21_grep.c VAR -f test_ptrn_grep.txt" \
#             "-e while -e void s21_grep.c Makefile VAR -f test_ptrn_grep.txt"
#             do
#                 var="-${combination}"
#                 testing $i
#             done
#         fi
#     done
# done

# # параметры v c l n h
# params=(v c l n h)

# # циклы для 2 сдвоенных параметров
# for i in $(seq 1 3); do
#     for combination in $(echo ${params[@]} | tr ' ' '\n' | tr -d '\n' | grep -o . | uniq | tr -d '\n'); do
#         if [ "${#combination}" -eq 2 ]; then
#             for i in \
#             "s test_0_grep.txt VAR" \
#             "for s21_grep.c s21_grep.h Makefile VAR" \
#             "for s21_grep.c VAR" \
#             "-e for -e ^int s21_grep.c s21_grep.h Makefile VAR" \
#             "-e for -e ^int s21_grep.c VAR" \
#             "-e regex -e ^print s21_grep.c VAR -f test_ptrn_grep.txt" \
#             "-e while -e void s21_grep.c Makefile VAR -f test_ptrn_grep.txt"
#             do
#                 var="-${combination}"
#                 testing $i
#             done
#         fi
#     done
# done

# # параметры v c l n h
# params=(v c l n h)

# # циклы для 3 сдвоенных параметров
# for i in $(seq 1 3); do
#     for combination in $(echo ${params[@]} | tr ' ' '\n' | tr -d '\n' | grep -o . | uniq | tr -d '\n'); do
#         if [ "${#combination}" -eq 3 ]; then
#             for i in \
#             "s test_0_grep.txt VAR" \
#             "for s21_grep.c s21_grep.h Makefile VAR" \
#             "for s21_grep.c VAR" \
#             "-e for -e ^int s21_grep.c s21_grep.h Makefile VAR" \
#             "-e for -e ^int s21_grep.c VAR" \
#             "-e regex -e ^print s21_grep.c VAR -f test_ptrn_grep.txt" \
#             "-e while -e void s21_grep.c Makefile VAR -f test_ptrn_grep.txt"
#             do
#                 var="-${combination}"
#                 testing $i
#             done
#         fi
#     done
# done

# echo "\033[31mFAIL: $FAIL\033[0m"
# echo "\033[32mSUCCESS: $SUCCESS\033[0m"
# echo "ALL: $COUNTER"

# Установка начальных значений переменных
TEMPLATE="yes" # Параметр для поиска 
PATTERN="test_files/grep_pattern.txt" # Путь до файла с паттернами 
TEMPLATE_FILE="test_files/grep_test.txt" # Путь до файла с параметрами 
TEST_FILE="test_files/grep_test.txt" # Путь до файла тестируемого
S21="./s21_grep" # Исполняемый
GREP="grep.txt" # Файл для записи логов грепа заводского
S21_GREP="s21_grep.txt" # Файл для записи логов тестируемого грепа
LOG="grep_log.txt" # Файл для записи логов

SUCCESS=0
FAIL=0

# Очистка лог-файла
echo "" > $LOG

# Вывод информации о файлах для тестирования
echo Testing file: $TEST_FILE
echo Template file: $TEMPLATE_FILE

# Тестирование параметров для grep и s21_grep на первом файле
for var in -e -i -v -c -l -n -h -s -o
do
    # Запуск s21_grep с текущим параметром и сохранение вывода в файл s21_grep.txt
    $S21 $var $TEMPLATE $TEMPLATE_FILE  > $S21_GREP 
    # Запуск grep с текущим параметром и сохранение вывода в файл grep.txt
    grep $var $TEMPLATE $TEMPLATE_FILE > $GREP 

    # Сравнение файлов s21_grep.txt и grep.txt. Если они одинаковы, то тест прошел успешно
    if cmp -s $S21_GREP $GREP; then
        SUCCESS=$((SUCCESS+1))
    else
        # Иначе добавляем текущий параметр в лог-файл и увеличиваем счетчик неудачных тестов
        echo "$var" >> $LOG
        echo "$var" 
        FAIL=$((FAIL+1))
    fi
    # Удаление временных файлов s21_grep.txt и grep.txt
    rm $S21_GREP $GREP
done

# ... (Остальной код без изменений)


# Тестирование параметров для grep и s21_grep на втором файле
for var in -e -i -v -c -l -h -s -o -n
do
    param=$(echo "$@" | sed "s/FLAGS/$var/")
    $S21 $var $TEMPLATE $TEMPLATE_FILE test_files/grep_test_2.txt > $S21_GREP 
    grep $var $TEMPLATE $TEMPLATE_FILE test_files/grep_test_2.txt > $GREP 
    if cmp -s $S21_GREP $GREP; then
        SUCCESS=$((SUCCESS+1))
    else
        echo "$var" >> $LOG
        echo "$var" 
        FAIL=$((FAIL+1))
    fi
    rm $S21_GREP $GREP
done

# Цикл по набору опций для поиска с помощью команды $S21
for var in -c -ce -ch -cn -co -cs -he -ho -hs -ic -ie -ih -il -in -io -is -iv -l -le -lh -ln -lo -ls -n -ne
do
    # Выполнение команды $S21 с текущей опцией $var и запись результата в файл $S21_GREP
    $S21 $var $TEMPLATE $TEMPLATE_FILE  > $S21_GREP 
    # Поиск с помощью grep с текущей опцией $var и запись результата в файл $GREP
    grep $var $TEMPLATE $TEMPLATE_FILE > $GREP 
    # Сравнение файлов $S21_GREP и $GREP. Если они одинаковы, то увеличиваем счетчик успешных проверок
    if cmp -s $S21_GREP $GREP; then
        SUCCESS=$((SUCCESS+1))
    else
        # Если файлы не одинаковы, то записываем опцию в файл $LOG и увеличиваем счетчик неуспешных проверок
        # Выводим неуспешные на экран для удобства
        echo "$var" >> $LOG
        echo "$var" 
        FAIL=$((FAIL+1))
    fi
    # Удаление временных файлов
    rm $S21_GREP $GREP
done

# Цикл по набору опций для поиска с помощью команды $S21
for var in -f -cf -hf -lf -nf -nh -no -ns -o -oe -se -v -vc -ve -vh -vl -vn -vs
do
    # Выполнение команды $S21 с текущей опцией $var и запись результата в файл $S21_GREP
    $S21 $var $PATTERN $TEMPLATE_FILE  > $S21_GREP 
    # Поиск с помощью grep с текущей опцией $var и запись результата в файл $GREP 
    grep $var $PATTERN $TEMPLATE_FILE > $GREP 
    # Сравнение файлов $S21_GREP и $GREP. Если они одинаковы, то увеличиваем счетчик успешных проверок
    if cmp -s $S21_GREP $GREP; then
        SUCCESS=$((SUCCESS+1))
    else
        # Если файлы не одинаковы, то записываем опцию в файл $LOG и увеличиваем счетчик неуспешных проверок
        echo "$var" >> $LOG
        echo "$var" 
        FAIL=$((FAIL+1))
    fi
    # Удаление временных файлов
    rm $S21_GREP $GREP
done


# поиск строк, содержащих шаблон и "who" в файле шаблона, вывод в файл
grep -e $TEMPLATE -e who $TEMPLATE_FILE > $GREP
# аналогичный поиск с помощью программы $S21, вывод в файл
$S21 -e $TEMPLATE -e who $TEMPLATE_FILE > $S21_GREP
# если содержимое файлов $S21_GREP и $GREP идентичны, увеличить значение переменной SUCCESS на 1, иначе на 1 для переменной FAIL
if cmp -s $S21_GREP $GREP; then
    SUCCESS=$((SUCCESS+1))
else
    FAIL=$((FAIL+1))
fi
# удалить созданные временные файлы
rm $S21_GREP $GREP

# поиск строк, соответствующих паттерну в файле для тестирования, вывод в файл
grep -f $PATTERN -e tyt $TEST_FILE > $GREP
# аналогичный поиск с помощью программы $S21, вывод в файл
$S21 -f $PATTERN -e tyt $TEST_FILE > $S21_GREP 
# если содержимое файлов $S21_GREP и $GREP идентичны, увеличить значение переменной SUCCESS на 1, иначе на 1 для переменной FAIL, и записать "-f -e" в файл $LOG
if cmp -s $S21_GREP $GREP; then
    SUCCESS=$((SUCCESS+1))
else
    echo "-f -e" >> $LOG
    FAIL=$((FAIL+1))
fi

# # поиск строк, содержащих шаблон в файле для тестирования и файле grep_s21.h, вывод в файл
# grep -h $TEMPLATE $TEST_FILE grep_s21.h > $GREP
# # аналогичный поиск с помощью программы $S21, вывод в файл
# $S21 -h $TEMPLATE $TEST_FILE grep_s21.h > $S21_GREP
# # если содержимое файлов $S21_GREP и $GREP идентичны, увеличить значение переменной SUCCESS на 1, иначе на 1 для переменной FAIL, и записать "-h" в файл $LOG
# if cmp -s $S21_GREP $GREP; then
#     SUCCESS=$((SUCCESS+1))
# else
#     echo "-h" >> $LOG
#     FAIL=$((FAIL+1))
# fi

# удалить созданные временные файлы
rm $GREP $S21_GREP

# если значение переменной FAIL не равно 0, вывести количество успешных и неуспешных тестов, завершить скрипт с кодом 9, иначе удалить файл $LOG и вывести количество успешных и неуспешных тестов
if [ $FAIL != 0 ]
then
    echo "SUCCESS: $SUCCESS"
    echo "FAIL: $FAIL"
    exit 9
else
    rm $LOG
    echo "SUCCESS: $SUCCESS"
    echo "FAIL: $FAIL"
fi