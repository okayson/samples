#include <iostream>
#include "mylib.h"

int add(int a, int b)
{
	return (a+b);
}

Foo::Foo(){}
Foo::~Foo(){}
void Foo::hello()
{
	std::cout << "Hello!!" << std::endl;
}
