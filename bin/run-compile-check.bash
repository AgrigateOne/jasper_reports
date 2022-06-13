#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

# This function checks through the set of files to be committed and ensures that
# every .jrxml has a matching .jasper file (and vice-versa).
# If not, the commit should be aborted.
function source_and_binary_ok() {
  AR=("$@")
  WRONG=()
  SRC=()
  BIN=()
  # echo "Full Array: ${AR[@]}"
  for fn in "${AR[@]}"; do
    if [[ "$fn" == *.jrxml ]]
    then
      SRC+=("${fn%.*}")
    fi
    if [[ "$fn" == *.jasper ]]
    then
      BIN+=("${fn%.*}")
    fi
  done
  # echo "Src Array: ${SRC[@]}"
  # echo "Bin Array: ${BIN[@]}"
  for fn in "${SRC[@]}"; do
    if ! [[ ${BIN[*]} =~ "$fn" ]]
    then
      WRONG+=("$fn.jrxml")
    fi
  done
  for fn in "${BIN[@]}"; do
    if ! [[ ${SRC[*]} =~ "$fn" ]]
    then
      WRONG+=("$fn.jasper")
    fi
  done

  if (( ${#WRONG[@]} > 0 ));
  then
    echo -e "\nThe following reports cannot be committed (commit must include both .jrxml and .jasper files):"
    printf '%s\n' "${WRONG[@]}"
    return 1
  else
    return 0
  fi
}

echo "Checking reports for source and compiled files..."

# LIST="file1.jrxml file1.jasper file2.jrxml dummy file3.jasper nspack/addendum/addendum.jrxml"
# Get a list of the files selected for this commit:
LIST=$(git diff --cached --name-only --diff-filter=ACM)
array=(${LIST})
# echo $LIST
# echo "Length: ${#array[@]}"
# echo "Full Array: ${array[@]}"

if source_and_binary_ok "${array[@]}"
then
  echo 'Report file sets are OK'
  exit 0
else
  echo ''
  exit 1
fi
