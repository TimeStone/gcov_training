// example1.cpp

int foo(int param)
{
     if (param)
     {
         return param;
     }
     else
     {
         return 0;
     }
 }

int main(int argc, char* argv[])
 {
     return foo(argc-1);
 }

