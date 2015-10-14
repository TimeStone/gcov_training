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

echo "######################################################"
echo "Exclude 3rd '*.4.4.7*' '/usr/include/*'"
echo "Run 'lcov -r coverage.info '*4.4.7*' '/usr/include/*' -o coverage.info'"
echo "Run 'lcov -l coverage.info'"
echo "Run 'genhtml -t MyReportTitle -o coverage_no3rd  coverage.info'"
echo "######################################################"
lcov -r coverage.info '*4.4.7*' '/usr/include/*' -o coverage.info  # <---ingnore 3rd here
lcov -l coverage.info
genhtml -t MyReportTitle -o coverage_no3rd  coverage.info
#firefox coverage/index.html&
#firefox coverage_no3rd/index.html&
