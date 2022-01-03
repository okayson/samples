#!/bin/bash

value=1
# using `[` command.
if [ ${value} -eq 1 ] ; then
  echo 'processing "if" with [ ] command.'
fi

# using `test` command.
if test ${value} -eq 1  ; then
  # echo "processing \"if\" with \"test\" command."
  echo 'processing "if" with "test" command.'
fi

# if else
value=2
if [ ${value} -eq 1 ] ; then
  echo 'processing "if" with [ ] command.'
elif [ ${value} -eq 2 ] ; then
  echo 'processing "elif" with [ ] command.'
else
  echo 'processing "else" with [ ] command.'
fi

num1=10
num2=10
if test $num1 -eq $num2 ; then
  echo "-eq means =="
fi

num1=10
num2=20
if test $num1 -ne $num2 ; then
  echo "-ne means !="
fi

num1=19
# num1=20
num2=20
if test $num1 -lt $num2 ; then
  echo "-lt means <"
fi

num1=20
num2=20
if test $num1 -le $num2 ; then
  echo "-le means <="
fi

num1=20
num2=20
if test $num1 -gt $num2 ; then
  echo "-gt means <"
fi

num1=20
num2=20
if test $num1 -ge $num2 ; then
  echo "-ge means <="
fi

# 文字列の比較
str1="hoge"
str2="hoge"
# if test $str1 == $str2 ; then
if test "$str1" == "$str2" ; then
  echo "same string"
fi

# その他の比較

# test -z string
# string の文字列長が 0 ならば真となる。
# other1
if test -z "$other1"  ; then
  echo 'comparision variable is not declared => "-z" return true'
fi
other1=""
if test -z "$other1"  ; then
  echo 'comparision variable is emply => "-z" return true'
fi
other1="aaa"
if test -z "$other1"  ; then
  echo '### not pass here ###'
else
  echo 'comparision variable is "aaa" => "-z" return false'
fi

# test -n string
# string の文字列長が 0 より大ならば真となる。
# other2
if [ -n $other2 ] ; then
  echo 'NG usage: comparision variable is not declared & not enclosed with " => "-n" return true'
fi

if [ -n "$other2" ] ; then
  echo '### not pass here ###'
else
  echo 'OK usage: comparision variable is not declared & enclosed with " => "-n" return false'
fi

other2=""
if test -n "$other2"  ; then
  echo '### not pass here ###'
else
  echo 'comparision variable is emply => "-n" return true'
fi

other2="aaa"
if test -n "$other2"  ; then
  echo 'comparision variable is "aaa" => "-n" return true'
fi

# -d	test -d file	file がディレクトリならば真となる。
# -f	test -f file	file が普通のファイルならば真となる。
# -s	test -s file	file が 0 より大きいサイズならば真となる。
# -e	test -e file	file が存在するならば真となる。
# -r	test -r file	file が読み取り可能ならば真となる。
# -w	test -w file	file が書き込み可能ならば真となる。
# -x	test -x file	file が実行可能ならば真となる。

