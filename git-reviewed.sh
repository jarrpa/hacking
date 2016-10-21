#!/bin/bash

# git-reviewed.sh <AUTHOR> ...
#
# A git utility script to append review tags to the current commit's message
# Each tag takes the format of "Reviewed-by: <AUTHOR>". Each parameter to this
# script is treated as a separate <AUTHOR> which will have its own tag.
# Each <AUTHOR> is taken as a literal string, so if <AUTHOR> has spaces be
# sure to enclose it in double quotes.

if [[ $# -eq 0 ]] ; then
  echo "ERROR: Must provide at least one author."
  exit 1
fi

AUTHORS=()

while [[ $# -gt 0 ]]; do
  AUTHORS+=("$1")
  shift
done

MSG_FILE=".git/COMMIT_EDITMSG"

MSG=$(git log -1 --pretty=%B)
TAGS=""

for AUTHOR in "${AUTHORS[@]}"; do
  RB="Reviewed-by: "$AUTHOR
  if !(echo -e "$MSG" | grep -qs "^$RB"); then
    TAGS=${TAGS}${RB}"\n"
  fi
done

if [ -n "$TAGS" ]; then
  echo "$MSG" > $MSG_FILE
  sed -i "\$a$TAGS" $MSG_FILE
  git commit --amend -F $MSG_FILE --cleanup=strip
fi
