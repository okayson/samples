#include <iostream>
#include <mylib.h>


int main(int argc, char const* argv[])
{
	std::cout << add(1,2) << std::endl;
	std::cout << add(2,3) << std::endl;

	Foo foo;
	foo.hello();

	return 0;
}

