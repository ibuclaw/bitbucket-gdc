class A
{
	double foo(double x)
	in
	{
		assert(x>0);
	}
	body
	{
		return x+1;
	}
}

class B : A
{
	override double foo(double x)
	in
	{
		assert(x>10);
	}
	body
	{
		return x+10;
	}
}
