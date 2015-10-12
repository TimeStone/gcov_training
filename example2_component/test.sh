#!/bin/sh

which gcov
which lcov

rm -rf *.o *.gcda *.gcno *.gcov program* coverage* build.log
echo "######################################################"
echo "Files before compile"
echo "######################################################"
ls -lah

echo "######################################################"
echo "Compile with GCOV compiler options:" 
echo "######################################################"
g++ -fprofile-arcs -ftest-coverage -fPIC -O0 example1.cpp -o program1
g++ -fprofile-arcs -ftest-coverage -fPIC -O0 example2.cpp -o program2

#Run Test
echo "######################################################"
echo "Running test1 './program1' and check coverage"
echo "######################################################"
./program1
if (( $?==0 ));
then
        echo "Test OK!"
else
        echo "Test Failed!"
fi
gcov example1.cpp

