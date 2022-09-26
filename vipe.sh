#!/bin/sh

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

VERSION="0.1.1"

# usage

if [ "${1}" ]; then
  case "${1}" in
  "-h")
    echo "usage: vipe [-hV]"
    exit 0 ;;
  "-V")
    echo "$VERSION"
    exit 0 ;;
  *)
    echo "unknown option: \"${1}\""
    echo "usage: vipe [-hV]"
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

${EDITOR} $t < /dev/tty > /dev/tty || exit $?

# write to stdout

cat $t

# cleanup

rm $t

