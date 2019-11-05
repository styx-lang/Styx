#!/bin/bash
set -e

build/unstable src/main.z build/unstable_test1.c
gcc -g -Wall build/unstable_test1.c -o build/unstable_test1

build/unstable src/main.z build/unstable_test2.c

if ! diff build/unstable_test1.c build/unstable_test2.c; then
    echo "===== Error: self compile is inconsistent! ====="
else
    echo "===== Self compile is consistent ====="
fi
