// example1.cpp
//#include <iostream>

int foo(int param)
{
     if (param)
     {
 //        std::cout << "Have " << param << " arguments:" << std::endl; 
         return param;
     }
     else
     {
   //      std::cout << "Have " << param << " arguments:" << std::endl; 
         return 0;
     }
 }

int main(int argc, char* argv[])
 {
     return foo(argc-1);
 }

