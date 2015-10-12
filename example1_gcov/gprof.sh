#!/bin/bash

rm -rf program gmon*
g++ -pg -fPIC -O0 example1.cpp -o program


if [ $# -ne 1 ]; then
    echo "gprof.sh <number of runs>"
    exit 1
fi

for i in $(seq 1 $1); do

    # Run profiled program
    ./program -d /dev/md126 -b 1048576 -t 10 -n 1000

    # Accumulate gprof statistic
    if [ -e gmon.sum ]; then
        gprof -s program gmon.out gmon.sum
    else
        mv gmon.out gmon.sum
    fi
done

gprof program gmon.sum > gmon.profile
