#!/bin/bash
set -e

mkdir -p build/csrc/unstable_test1
for filename in src/*.z; do
    echo $filename
    build/unstable "$filename" "build/csrc/unstable_test1/$(basename "$filename" .z).c"
done

cp src/unity.c build/csrc/unstable_test1/unity.c
gcc -g -Wall build/csrc/unstable_test1/unity.c -o build/unstable_test1

mkdir -p build/csrc/unstable_test2
for filename in src/*.z; do
    echo $filename
    build/unstable "$filename" "build/csrc/unstable_test2/$(basename "$filename" .z).c"
done

cp src/unity.c build/csrc/unstable_test2/unity.c

if ! diff build/csrc/unstable_test1 build/csrc/unstable_test2; then
    echo "===== Error: self compile is inconsistent! ====="
else
    echo "===== Self compile is consistent ====="
fi
