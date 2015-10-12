#!/bin/sh

./test.txt > build.log

echo "######################################################"
echo "Generate report with LCOV and genhtml:"
echo "######################################################"
set -x

lcov -c -d ./ -o coverage.info
lcov -l coverage.info

genhtml -t MyReportTitle -o coverage  coverage.info
#firefox coverage/index.html&
