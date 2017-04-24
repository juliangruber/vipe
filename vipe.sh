#!/usr/bin/env bash

#
# vipe(1) - Pipe in and out of $EDITOR
#
# (c) 2014 Julian Gruber <julian@juliangruber.com>.
# MIT licensed.
#
# Example:
#
#   $ echo foo | vipe | gist
#   $ vipe | gist
#
# This is a lightweight bash only version. For the original impementation in
# python, check https://github.com/madx/moreutils/blob/master/vipe
#

# version

VERSION="0.1.0"

# Set this to 1 to output filename instead of file contents.
usexargs=0

# usage
if [ -n "${1}" ]; then
  case "${1}" in
  "-h")
    echo "usage: vipe [-hVx]"
    echo
    echo "-h this help"
    echo "-V version"
    echo "-x output filename instead of file contents."
    echo "   Use this to run with xargs to run the filename not stream the file contents."
    echo "   Example: cat longfile.sh | vipe -x | xargs sh"
    exit 0 ;;
  "-V")
    echo "$VERSION"
    exit 0 ;;
  "-x")
    usexargs=1
    ;;
  *)
    echo "unknown option: \"${1}\""
    echo "usage: vipe [-hVx]"
    exit 1 
  esac
fi

# temp file

t=/tmp/vipe.$$.txt
touch $t

# read from stdin

if [ ! -t 0 ]; then
  cat > $t
fi

# spawn editor with stdio connected

${EDITOR:-vi} $t < /dev/tty > /dev/tty || exit $?

if [ "${usexargs}" -eq 1 ]; then
  echo $t
else
  # write to stdout
  cat $t

  # cleanup
  rm $t
fi
