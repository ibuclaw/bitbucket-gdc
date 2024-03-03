// PERMUTE_ARGS: -inline -g -O

extern(C) int printf(const char*, ...);

/*******************************************/

class A
{
     int x = 7;

     int foo(int i)
     out (result)
     {
        assert(result & 1);
        assert(x == 7);
     }
     body
     {
        return i;
     }
}

class B : A
{
     override int foo(int i)
/+
     out (result)
     {
        assert(result < 8);
        assert(x == 7);
     }
     body
+/
     {
        return i - 1;
     }
}
