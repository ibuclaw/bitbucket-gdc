import std.stdio;

struct Test
{
public:
	this(int initX)
	{
		x = initX;
	}

	typeof(this) opBinary(string op : "+")(typeof(this) other)
	{
		return typeof(this)(x + other.x);
	}

	int x;
}

int main(string[] args)
{
	Test test1 = Test(2);
	Test test2 = Test(5);
	assert((test1 + test2).x == 7);	//This causes a compiler error
	return 0;
}
