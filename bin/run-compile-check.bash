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
    # echo "$fn";
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
      WRONG+=("$fn")
    fi
  done
  for fn in "${BIN[@]}"; do
    if ! [[ ${SRC[*]} =~ "$fn" ]]
    then
      WRONG+=("$fn")
    fi
  done

  if (( ${#WRONG[@]} > 0 ));
  then
    echo "The following reports cannot be committed (commit must include both .jrxml and .jasper files):"
    printf '%s\n' "${WRONG[@]}"
    return 1
  else
    return 0
  fi
}

echo "Checking reports for source and compiled files..."

# LIST=('file1.jrxml' 'file1.jasper' 'file2.jrxml' 'dummy' 'file3.jasper')
LIST=$(git status -su | awk '{sub(/^(R.*-> )|[ MA?]+/,"")};1' | awk '!/^D/')

# echo "Full Array: ${LIST[@]}"
# echo "Length: ${#LIST[@]}"

if source_and_binary_ok "${LIST[@]}"
then
  echo 'Report file sets are OK'
  exit 0
else
  exit 1
fi
