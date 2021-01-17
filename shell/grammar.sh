#!/bin/bash

cd `dirname $0`

# User input
# read input_value
# echo "Input value is '${input_value}'"

# if
# Command existing check.
if type grep  >/dev/null 2>&1 ; then
  echo "type grep => True"
fi

# Test command.
# It's same command 'test' and '['.
if test -f ../README.md; then
  echo "../README.md exists."
fi
if [ -f ../README.md ]; then
  echo "../README.md exists."
fi
if [ -d ../shell ]; then
  echo "../shell exists."
fi

# Enclose varialbe in ".
value=""
if [ "${value}" != "val" ]; then  # OK
# if [ ${value} != "val" ]; then  # NG
  echo '${value} is not val'
fi

# NULL check
# foo="a"
if [ -z ${foo} ]; then
  echo '${foo} is null'
else
  echo '${foo} is not null'
fi

# for
echo "--- echo file list---"
for file in $(ls *.sh);
do
  echo ${file}
done


# AND/OR List
[ -f ../README.md ]  && echo "README is found."
[ -f ../README2.md ] && echo "README2 is found."
[ -f ../README.md ]  || echo "README is not found."
[ -f ../README2.md ] || echo "README2 is not found."


# Statement Block
[ -f ../README.md ]  && {
  echo "+++++++++++++++++++++++++++++"
  echo "This is Statement Block Test."
  echo "+++++++++++++++++++++++++++++"
}

# Null Command
if [ -f ../README2.md ]; then
  :    # null command. This is same as typing 'true'.
else
  echo  "README2 is not found."
fi

# set
set a b c
printf "set a b c ... "
echo "\$# is $#. \$@ is $@"
printf "shift 1 ... "
shift 1
echo "\$# is $#. \$@ is $@"

# printf
int_val=10
str_val="hello"
printf "%d %s\n" ${int_val} ${str_val}

# find
# -exec command ... \;
# Parameters after '-exec' and before '\;' are considered command parameters.
find ./ -type f -exec echo "Found ...{}!!" \;

# Calc command... $((xx))
x=0
while [ ${x} -ne 10 ] ; do
  printf "%d.." ${x}
  x=$((${x}+1))
done
printf "\n"

# Error check
cat << __EOT__
Not execute. Check error statement only.
$ bash -n script-name
__EOT__

#Execution Trace
echo "set -o xtrace ... trace ON"
echo "set +o xtrace ... trace OFF"
xtrace_expanded_value="This is expanded value"
set -o xtrace
echo "--- ${xtrace_expanded_value} ---"
set +o xtrace

# Parameter replacing.
echo "-- Parameter replacing -----"
# ${param:-default} ... If param is empty, default is used.
unset foo
echo ${foo:-"foo is not set. so use default"}
foo="foo is set"
echo ${foo:-"foo is not set. so use default"}

# ${#param} ... return length of param.
echo ${#foo}

# ${param%word} ... paramの末尾を起点として、wordに一致するparamの最短部分を削除し、残りの部分を返す。
# ${param%%word}... paramの末尾を起点として、wordに一致するparamの最長部分を削除し、残りの部分を返す。
# ${param#word} ... paramの先頭を起点として、wordに一致するparamの最短部分を削除し、残りの部分を返す。
# ${param##word}... paramの先頭を起点として、wordに一致するparamの最長部分を削除し、残りの部分を返す。
foo=/path1/path2/path3/path2/path1
echo ${foo%path2*}
echo ${foo%%path2*}
echo ${foo#*path2}
echo ${foo##*path2}

# trap
readonly TRAP_TEST_FILE="./trap_test.txt"
touch ${TRAP_TEST_FILE}

function trap_int() {
  echo "Handle signal INT."
  rm -rf ${TRAP_TEST_FILE}
}

trap trap_int INT

while [ -f ${TRAP_TEST_FILE} ]
do
  echo "wait for Ctrl-C."
  sleep 1
done

# If necessary, set exit code for normally.
# exit 0

