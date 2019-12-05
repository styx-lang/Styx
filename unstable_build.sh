#!/bin/bash
set -e

build/stage0 src/main.z "build/unstable.c"

gcc -g -Wall build/unstable.c -o build/unstable
