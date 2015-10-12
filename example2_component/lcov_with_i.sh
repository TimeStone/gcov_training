#!/bin/sh

./test.txt > build.log

echo "######################################################"
echo "Generate report with LCOV and genhtml:"
echo "######################################################"
set -x

lcov -i -c -d ./ -o coverage_base.info  # <--initial baseline, check http://ltp.sourceforge.net/coverage/lcov/lcov.1.php '-i' option  
lcov -c -d ./ -o coverage.info
lcov -a coverage_base.info -a  coverage.info -o  coverage.info  # <-- combine baseline and test coverage data
lcov -l coverage.info

genhtml -t MyReportTitle -o coverage  coverage.info
#firefox coverage/index.html&
