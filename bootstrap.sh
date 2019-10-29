#!/bin/bash
set -e

echo "===== Stage 1 ====="
mkdir -p build/csrc/stage1
for filename in src/*.z; do
    echo $filename
    build/stage0 "$filename" "build/csrc/stage1/$(basename "$filename" .z).c"
done

cp src/unity.c build/csrc/stage1/unity.c
gcc -g -Wall build/csrc/stage1/unity.c -o build/stage1

echo "===== Stage 2 ====="

mkdir -p build/csrc/stage2
for filename in src/*.z; do
    echo $filename
    build/stage1 "$filename" "build/csrc/stage2/$(basename "$filename" .z).c"
    echo $filename
done

clang-format -i build/csrc/stage2/*
cp src/unity.c build/csrc/stage2/unity.c
gcc -g -Wall build/csrc/stage2/unity.c -o build/stage2

echo "===== Stage 3 ====="

mkdir -p build/csrc/stage3
for filename in src/*.z; do
    echo $filename
    build/stage2 "$filename" "build/csrc/stage3/$(basename "$filename" .z).c"
done

clang-format -i build/csrc/stage3/*
cp src/unity.c build/csrc/stage3/unity.c

if ! diff build/csrc/stage2 build/csrc/stage3; then
    echo "===== Error: stage3 is different from stage 2! ====="
else
    echo "===== Done bootstrapping! ====="
fi
