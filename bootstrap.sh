#!/bin/bash
set -e

echo "===== Stage 1 ====="
build/stage0 src/main.z "build/stage1.c"
gcc -g -Wall build/stage1.c -o build/stage1

echo "===== Stage 2 ====="
build/stage1 src/main.z "build/stage2.c"
gcc -g -Wall build/stage2.c -o build/stage2

echo "===== Stage 3 ====="

build/stage2 src/main.z "build/stage3.c"

if ! diff build/stage2.c build/stage3.c; then
    echo "===== Error: stage3 is different from stage 2! ====="
else
    echo "===== Done bootstrapping! ====="
fi
