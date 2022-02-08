#include <iostream>
#include "birthday.h"
#include "person.h"

// Typically a class' constructor is named after the class itself
// the classes constructor is defined here and initialized with an initilizer list
// initializer list is a more modern way than using getters and setters
Person::Person(std::string n, Birthday b)
: name(n), bd(b)
{

}

// Typically a class' destructor is named after the class itself except with a ~ at the front
Person::~Person()
{

}

// the class' only function is defined here
void Person::printInfo()
{
    std::cout << name << std::endl;
    bd.printDate();
}
