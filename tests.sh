#!/bin/bash
set -e

mkdir -p build/testing

for filename in tests/*.expect; do
  test_name=$(basename "$filename" .expect)
  echo $test_name
  source="tests/${test_name}.z"
  output="build/testing/${test_name}.c"
  eval "$1" "$source" "$output" "lib"
  gcc "build/testing/${test_name}.c" -o "build/testing/${test_name}"
  "build/testing/${test_name}" | diff "tests/${test_name}.expect" -
done
