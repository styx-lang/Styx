#!/bin/bash
set -e

mkdir -p build/csrc/unstable
for filename in src/*.z; do
    echo $filename
    build/stage0 "$filename" "build/csrc/unstable/$(basename "$filename" .z).c"
done

cp src/unity.c build/csrc/unstable/unity.c
gcc -g -Wall build/csrc/unstable/unity.c -o build/unstable
