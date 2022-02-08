#include <iostream>
#include "birthday.h"

// Typically a class' constructor is named after the class itself
// the classes constructor is defined here and initialized with an initilizer list
// initializer list is a more modern way than using getters and setters
Birthday::Birthday(int m, int d, int y)
: month(m), day(d), year(y)
{  

}

// Typically a class' destructor is named after the class itself except with a ~ at the front
Birthday::~Birthday()
{

}

// the class' only function is defined here
void Birthday::printDate()
{
    std::cout << month << "/" << day << "/" << year << std::endl;
}
