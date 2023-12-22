#!/bin/bash

scp /home/gitlab-runner/builds/m6QP7zy6/0/students/DO6_CICD.ID_356283/thracebe_student.21_school.ru/DO6_CICD-2/cat/s21_cat -p 2223 thracebe2@10.0.2.2:/usr/local/bin
scp /home/gitlab-runner/builds/m6QP7zy6/0/students/DO6_CICD.ID_356283/thracebe_student.21_school.ru/DO6_CICD-2/grep/s21_grep -p 2223 thracebe2@10.0.2.2:/usr/local/bin

ssh -p 2223 thracebe2@10.0.2.2 ls -lah /usr/local/bin