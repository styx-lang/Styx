#!/bin/bash
set -e

time build/stage0 src/main.z "build/unstable.c"

time gcc -g -Wall build/unstable.c -o build/unstable
