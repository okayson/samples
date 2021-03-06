#!/bin/bash
# vim: shiftwidth=2 softtabstop=2 tabstop=2 expandtab

# Set current directory
cd `dirname $0`

# Usage
function usage() {

cat << __EOT__
Usage: 
  $(basename $0) [-a] [-b] [-f filename] arg

Description:
  This command do something according to arg.

Options:
  -a do a for arg.
  -b do b for arg.
  -f do something for filename.

Examples:
  $(basename $0) -ab arg
  $(basename $0) -f filename arg

__EOT__
exit 1
}

# Parse arguments {{{
if [ "$OPTIND" != 1 ]; then
  echo "No installed getopts-command." 1>&2
  exit 1
fi

# ':' means the option needs option argument. 
# It's avairable to type 'command -ab'.
opt_a="off"
opt_b="off"
opt_f="off"
while getopts abf:h OPT
do
  case $OPT in
    a)
      opt_a="on"
      ;;
    b)
      opt_b="on"
      ;;
    f)
      opt_f=$OPTARG
      ;;
    h)
      usage
      ;;
    \?)
      echo "Try to enter the h option." 1>&2
      exit 1
      ;;
  esac
done

echo "-a is $opt_a"
echo "-b is $opt_b"
echo "-f is $opt_f"

echo "Argument is $#."
echo "Argument before shift: $*"
shift $((OPTIND - 1))
echo "Argument after  shift: $*"
echo "Argument is $#."

if [ $# -ge 1 ]; then
  echo "arg is $1"
else
  echo "arg is none"
fi


# Parse arguments }}}

# Constant variable: use 'readonly' with upper case.
readonly CONSTANT_VALUE=10
# Absolute path or dir:
readonly HOGE_FILE="/path/to/file/hoge.txt"
readonly HOGE_DIR="/path/to/dir/hoge"
# Name only:
readonly HOGE_FILENAME="hoge.txt"
readonly HOGE_DIRNAME="hoge"

# Non Constant variable: use lower case.
not_constant_value=20

# Function name: snake case.
# Function control: use 'return'. 0=OK, 0!=ERROR
# Local variable: lower case with suffix '_'.
function use_local_variable() {
  local local_value_=30

  return 0
}

# Redirect: left hand side=space, right hand side=no-space
echo "Hello hoge" >/dev/null

# Redirect Grouping:
{
  echo "----------"
  echo "This is "
  echo "redirect "
  echo "group. "
  echo "----------"
} 1>&2

# Pipe: 
cat <<__EOT__
# one line
command1 | command2

# multi line (long command piping)
command1 \
  | command2 \
  | command3 \
  | command4
__EOT__

# cf. https://qiita.com/mashumashu/items/f5b5ff62fef8af0859c5
# cf. https://qiita.com/ma91n/items/5f72ca668f1c58176644
# cf. https://qiita.com/b4b4r07/items/dcd6be0bb9c9185475bb

