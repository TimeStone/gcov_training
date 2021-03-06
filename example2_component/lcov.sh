#!/bin/sh

./build_test.sh > build.log
echo "######################################################"
echo "Generate report with LCOV and genhtml:"
echo "Run 'lcov -c -d ./ -o coverage.info'"
echo "######################################################"
lcov -c -d ./ -o coverage.info

echo "######################################################"
echo "All include 3rd"
echo "Run 'lcov -l coverage.info'"
echo "Run 'genhtml -t MyReportTitle -o coverage  coverage.info'"
echo "######################################################"
lcov -l coverage.info
genhtml -t MyReportTitle -o coverage  coverage.info

